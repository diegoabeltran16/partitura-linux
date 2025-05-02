#!/bin/bash

################################################################################
# 🔓 descifrar-estricto.sh (versión Ed25519)
#
# Este script descifra un archivo GPG (.asc o .tid) y verifica que:
# - La firma digital esté presente y válida
# - La clave firmante coincida con tu clave Ed25519 autorizada
#
# ✅ Funciona con archivos .asc generados por `cifrar.sh` (Ed25519)
# ✅ Rechaza cualquier archivo no firmado por tu clave exacta
# ✅ Soporta extracción desde archivos .tid (TiddlyWiki)
#
# Uso:
#   ./descifrar-estricto.sh archivo.asc
#   ./descifrar-estricto.sh archivo.tid
################################################################################

# === 1️⃣ CONFIGURA TU FINGERPRINT AUTORIZADO (últimos 8 caracteres) ===
FIRMA_AUTORIZADA="F3B79C1D"  # ← Cambia esto por el Key ID corto de tu Ed25519

# === 2️⃣ Validación de entrada ===
if [ -z "$1" ]; then
  echo "❌ Uso: ./descifrar-estricto.sh archivo.asc|archivo.tid"
  exit 1
fi

archivo="$1"

# === 3️⃣ Verificación de existencia ===
if [ ! -f "$archivo" ]; then
  echo "❌ El archivo '$archivo' no existe."
  exit 1
fi

# === 4️⃣ Extraer bloque PGP si es .tid ===
if [[ "$archivo" == *.tid ]]; then
  echo "📦 Extrayendo bloque PGP desde tiddler..."
  bloque=$(awk '/-----BEGIN PGP MESSAGE-----/,/-----END PGP MESSAGE-----/' "$archivo")
  if [[ -z "$bloque" ]]; then
    echo "❌ No se encontró un bloque PGP válido dentro del archivo .tid."
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

# === 5️⃣ Verificar firma y descifrar ===
echo "🔐 Descifrando y verificando firma..."

gpg_output=$(gpg -d "$archivo_temp" 2>&1 > "$salida")
gpg_exit=$?

if [ $gpg_exit -ne 0 ]; then
  echo "❌ Error al descifrar:"
  echo "$gpg_output"
  rm -f "$salida"
  [[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
  exit 1
fi

# === 6️⃣ Validar firma ===
firma_valida=$(echo "$gpg_output" | grep "Good signature from")
clave_firmante=$(echo "$gpg_output" | grep "using EDDSA key" | grep -o '[A-F0-9]\{8\}$')

if [[ -z "$firma_valida" || "$clave_firmante" != "$FIRMA_AUTORIZADA" ]]; then
  echo "🚫 Firma inválida o no autorizada."
  echo "   Esperado: $FIRMA_AUTORIZADA"
  echo "   Encontrado: ${clave_firmante:-ninguna}"
  rm -f "$salida"
  [[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
  exit 1
fi

# === 7️⃣ Limpieza y confirmación ===
[[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
echo "✅ Firma válida detectada:"
echo "   $firma_valida"
echo "📄 Archivo descifrado guardado como: '$salida'"

################################################################################
# ✅ ¿Qué debes hacer antes de usar este script?
#
#1. Obtener el ID corto de tu clave Ed25519:
#
# bash 
# `gpg --list-secret-keys --keyid-format=long`
#
# Busca la línea como:
#
# matlab
#
# `sec ed25519/ABCD1234EFGH5678 ...`
#
# Toma los últimos 8 caracteres:  
# ➡️ `F3B79C1D` (o los correspondientes en tu caso)
#
# 2. Reemplaza en el script:
#
# bash
#
# `FIRMA_AUTORIZADA="F3B79C1D"`
################################################################################