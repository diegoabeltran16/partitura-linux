#!/bin/bash

################################################################################
# 🔐 cifrar.sh (Ed25519 Edition)
#
# Este script cifra un archivo con GPG usando cifrado simétrico (AES-256)
# y lo firma digitalmente con tu clave Ed25519 preconfigurada.
#
# 🧩 Resultado: archivo .asc que puedes copiar a TiddlyWiki o enviar cifrado.
# 
# ✅ Firma digital con Ed25519 (moderna, rápida y compacta)
# ✅ Cifrado simétrico con passphrase manual (AES-256)
# ✅ Requiere GPG >= 2.2 y tu clave Ed25519 ya creada
#
# Uso:
#   ./cifrar.sh archivo.txt
#
# NOTA: Asegúrate de reemplazar el valor de `IDENTIDAD_FIRMA` por el UID
#       o el Key ID largo/corto de tu clave Ed25519.
################################################################################

# === 1️⃣ CONFIGURA TU IDENTIDAD DE FIRMA (Ed25519) ===
IDENTIDAD_FIRMA="Naveen-Ed25519"  # Puedes usar también el Key ID, ej: ABCD1234EFGH5678

# === 2️⃣ Validación del argumento de entrada ===
if [ -z "$1" ]; then
  echo "❌ Debes indicar el archivo a cifrar y firmar."
  echo "👉 Uso: ./cifrar.sh archivo.txt"
  exit 1
fi

archivo="$1"

# === 3️⃣ Verificación de existencia del archivo ===
if [ ! -f "$archivo" ]; then
  echo "❌ El archivo '$archivo' no existe."
  exit 1
fi

# === 4️⃣ Prevenir cifrado redundante ===
if [[ "$archivo" == *.asc ]]; then
  echo "⚠️ El archivo ya está en formato ASCII-armored (.asc)."
  exit 1
fi

# === 5️⃣ Mostrar detalles de la identidad de firma ===
echo "🔎 Verificando identidad de firma (Ed25519): $IDENTIDAD_FIRMA"

key_output=$(gpg --list-secret-keys --keyid-format=long "$IDENTIDAD_FIRMA")

if [ -z "$key_output" ]; then
  echo "❌ No se encontró la clave secreta '$IDENTIDAD_FIRMA'."
  echo "💡 Usa 'gpg --list-secret-keys --keyid-format=long' para revisar."
  exit 1
fi

key_id=$(echo "$key_output" | grep '^sec' | awk -F'/' '{print $2}' | awk '{print $1}')
fingerprint=$(gpg --fingerprint "$IDENTIDAD_FIRMA" | grep -A1 'Key fingerprint' | tail -n1 | xargs)

echo "✅ Clave encontrada:"
echo "🔐 Key ID       : $key_id"
echo "🔎 Fingerprint  : $fingerprint"
echo ""

# === 6️⃣ Solicitar confirmación explícita ===
read -p "¿Deseas usar esta clave para firmar y cifrar '$archivo'? (s/N): " confirm
if [[ "$confirm" != "s" && "$confirm" != "S" ]]; then
  echo "❌ Cancelado por el usuario."
  exit 1
fi

# === 7️⃣ Cifrado y firma ===
echo "🔐 Cifrando y firmando '$archivo' (Ed25519)..."
gpg --sign --armor -c --local-user "$IDENTIDAD_FIRMA" "$archivo"

# === 8️⃣ Eliminación segura ===
if [ $? -eq 0 ]; then
  echo "🧹 Eliminando el archivo original de forma segura con shred..."
  shred -u "$archivo"
  echo "✅ Archivo cifrado y firmado guardado como: '$archivo.asc'"
  echo "📋 Puedes insertar el bloque .asc en un tiddler sin problema."
else
  echo "❌ Error durante el proceso. El archivo original no fue eliminado."
  exit 1
fi
