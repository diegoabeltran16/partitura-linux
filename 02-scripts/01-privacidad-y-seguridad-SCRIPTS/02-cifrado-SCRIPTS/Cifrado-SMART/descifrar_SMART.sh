#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

################################################################################
# 🔐 descifrar_de_tiddlers.sh — Descifra .asc + detached-signatures desde JSON
#
# 🧠 Propósito:
#   • Toma un JSON exportado de TiddlyWiki (array de tiddlers)
#   • Extrae bloques cifrados (.asc) y sus firmas detached (.sig)
#   • Verifica cada firma contra claves autorizadas
#   • Descifra con passphrase simétrica y genera .txt
#
# ✍️ Autor: Naveen | 💻 Debian XFCE | 🛠️ Requiere: GnuPG, jq
################################################################################

# --- Dependencias y uso ---
if ! command -v jq &>/dev/null; then
  echo "❌ Instala jq: sudo apt-get install jq"
  exit 1
fi
if ! command -v gpg &>/dev/null; then
  echo "❌ Instala gpg: sudo apt-get install gnupg"
  exit 1
fi
if [[ $# -ne 1 ]]; then
  echo "Uso: $0 /ruta/a/tiddlers.json"
  exit 1
fi

JSON="$1"

# --- Configuración: key-IDs autorizados ---
readonly CLAVES_AUTORIZADAS=(
  Clave  # RSA3072
  Clave  # Ed25519
)

# --- Leer passphrase simétrica (un solo prompt) ---
read -s -p "🔐 Clave simétrica: " PASSPHRASE; echo

# --- Preparar directorio temporal ---
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

# --- Extraer títulos .asc del JSON ---
shopt -s nullglob
mapfile -t ASC_TITLES < <(
  jq -r '.[] | select(.title|endswith(".asc")) | .title' "$JSON"
)
if (( ${#ASC_TITLES[@]} == 0 )); then
  echo "⚠️  No se encontraron tiddlers .asc en $JSON"
  exit 0
fi

# --- Función de procesamiento ---
procesar() {
  local title="$1"
  local base="${title%.asc}"
  echo -e "\n📂 Procesando: $title"

  # 1️⃣ Extraer bloque cifrado
  jq -r --arg T "$title" '.[] | select(.title==$T) | .text' "$JSON" \
      > "$TMPDIR/$title"

  # 2️⃣ Verificar firmas detached
  mapfile -t SIGS < <(
    jq -r --arg T "$title" '.[] \
      | select(.title|startswith($T+".") and endswith(".sig")) \
      | .title' "$JSON"
  )
  if (( ${#SIGS[@]} > 0 )); then
    echo "🔍 Verificando ${#SIGS[@]} firma(s) detached..."
    for sig in "${SIGS[@]}"; do
      echo -n "  • $sig: "
      jq -r --arg S "$sig" '.[] | select(.title==$S) | .text' "$JSON" \
          > "$TMPDIR/$sig"
      # status-fd 2 envía status a stderr
      if gpg --batch --status-fd 2 --verify "$TMPDIR/$sig" "$TMPDIR/$title" 2>"$TMPDIR/status"; then
        keyid=$(awk '/^\[GNUPG:\] GOODSIG/ {print $3; exit}' "$TMPDIR/status")
        if printf '%s\n' "${CLAVES_AUTORIZADAS[@]}" | grep -qx "$keyid"; then
          echo "OK ($keyid)"
        else
          echo "🚫 NO autorizada ($keyid)"
        fi
      else
        echo "❌ INVÁLIDA"
      fi
    done
  else
    echo "⚠️  Sin firmas detached"
  fi

  # 3️⃣ Descifrar bloque
  local outfile="${base}.txt"
  echo -n "🔐 Descifrando → $outfile: "
  if gpg --batch --yes --pinentry-mode loopback \
         --passphrase "$PASSPHRASE" \
         --decrypt "$TMPDIR/$title" >"$outfile"; then
    echo "✅ OK"
  else
    echo "❌ ERROR"
    rm -f "$outfile"
  fi
}

# --- Iterar sobre todos los tiddlers .asc ---
for t in "${ASC_TITLES[@]}"; do
  procesar "$t"
done

echo -e "\n🎉 Fin del descifrado de tiddlers."
