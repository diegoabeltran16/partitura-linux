#!/bin/bash

################################################################################
# 🔐 descifrar-estricto.sh
#
# Este script descifra un archivo GPG (desde .asc o .tid) y verifica que:
# - La firma sea válida (Good signature)
# - La clave firmante coincida con tu ID o fingerprint autorizado
#
# Si no pasa esta verificación, NO se guarda el archivo descifrado.
################################################################################

# === CONFIGURACIÓN PERSONAL ===
FIRMA_AUTORIZADA="xxxxxxxx"  # ← Cambia esto por tu Key ID o último bloque de tu fingerprint

# === 1️⃣ Verificación de argumento ===
if [ -z "$1" ]; then
  echo "❌ Uso: ./descifrar-estricto.sh archivo.asc|archivo.tid"
  exit 1
fi

archivo="$1"

# === 2️⃣ Verificación de existencia ===
if [ ! -f "$archivo" ]; then
  echo "❌ El archivo '$archivo' no existe."
  exit 1
fi

# === 3️⃣ Si es .tid, extraer el bloque PGP ===
if [[ "$archivo" == *.tid ]]; then
  echo "🧪 Extrayendo bloque GPG del .tid..."

  bloque=$(awk '/-----BEGIN PGP MESSAGE-----/,/-----END PGP MESSAGE-----/' "$archivo")
  if [[ -z "$bloque" ]]; then
    echo "❌ No se encontró un bloque PGP válido."
    exit 1
  fi

  archivo_temp="$(mktemp)"
  echo "$bloque" > "$archivo_temp"

  titulo=$(awk -F: '/^title:/ {print $2}' "$archivo" | xargs)
  base="${titulo:-$(basename "$archivo" | cut -d. -f1)}"
else
  archivo_temp="$archivo"
  base="$(basename "$archivo" | cut -d. -f1)"
fi

salida="${base}.txt"

# === 4️⃣ Verificar firma y descifrar en simultáneo ===
echo "🔐 Descifrando y verificando firma..."
gpg_output=$(gpg -d "$archivo_temp" 2>&1 > "$salida")
gpg_exit=$?

# === 5️⃣ Verificación del resultado ===
if [ $gpg_exit -ne 0 ]; then
  echo "❌ Error al descifrar:"
  echo "$gpg_output"
  rm -f "$salida"
  [[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
  exit 1
fi

# === 6️⃣ Validar firma contra tu Key ID autorizado ===
firma_valida=$(echo "$gpg_output" | grep "Good signature from")
clave_firmante=$(echo "$gpg_output" | grep "using RSA key" | grep -o '[A-F0-9]\{8\}$')

if [[ -z "$firma_valida" || "$clave_firmante" != "$FIRMA_AUTORIZADA" ]]; then
  echo "🚫 Firma inválida o no autorizada."
  echo "   Se esperaba firma de: $FIRMA_AUTORIZADA"
  echo "   Pero se encontró     : $clave_firmante"
  rm -f "$salida"
  [[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
  exit 1
fi

# === 7️⃣ Confirmación final ===
[[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
echo "✅ Archivo descifrado y firma verificada de: $firma_valida"
echo "📄 Guardado como: $salida"
