#!/bin/bash

################################################################################
# 🔐 cifrar.sh
#
# Este script cifra un archivo con GPG utilizando cifrado simétrico (AES-256),
# y además lo firma digitalmente usando tu clave GPG personal.
# 
# El resultado es un archivo .asc (texto plano cifrado + firmado), 
# ideal para insertar en TiddlyWiki o enviar con alta seguridad.
#
# ✔️ Solicita explícitamente la identidad de firma
# ✔️ Elimina el archivo original de forma segura
# ✔️ Compatible con Linux, WSL y entornos donde esté GPG instalado
################################################################################

# === 🧪 Validación del argumento de entrada ===
if [ -z "$1" ]; then
  echo "❌ Debes indicar el archivo a cifrar y firmar."
  echo "👉 Uso: ./cifrar.sh archivo.txt"
  exit 1
fi

archivo="$1"

# === 📂 Validación de existencia del archivo ===
if [ ! -f "$archivo" ]; then
  echo "❌ El archivo '$archivo' no existe."
  exit 1
fi

# === 🚫 Prevenir doble cifrado accidental ===
if [[ "$archivo" == *.asc ]]; then
  echo "⚠️ El archivo ya parece estar cifrado (.asc)."
  exit 1
fi

# === 🔎 Mostrar claves secretas disponibles para firmar ===
echo "🧾 Claves disponibles para firmar:"
gpg --list-secret-keys --keyid-format=long | \
  grep -E '^sec|^uid' | \
  sed 's/^sec.*\///;s/^uid/   🔑/' || echo "❌ No se encontraron claves secretas."

# === 🧑‍💻 Solicitar la identidad para firmar ===
echo ""
read -p "✍️ Ingresa el ID, nombre o correo de la clave con la que deseas firmar: " identidad

# === ⚠️ Validación de la entrada ===
if [ -z "$identidad" ]; then
  echo "❌ Debes ingresar una identidad válida para firmar."
  exit 1
fi

# === 🔐 Cifrado y firma digital del archivo ===
echo ""
echo "🔐 Cifrando y firmando '$archivo' con la identidad: $identidad ..."
gpg --sign --armor -c --local-user "$identidad" "$archivo"

# === 🧹 Eliminación segura del archivo original ===
if [ $? -eq 0 ]; then
  echo "🧹 Eliminando el archivo original de forma segura con shred..."
  shred -u "$archivo"
  echo "✅ Archivo cifrado y firmado guardado como: '$archivo.asc'"
  echo "📋 Este archivo está protegido con cifrado simétrico y autenticado con tu firma GPG."
else
  echo "❌ Hubo un error durante el cifrado. El archivo original no fue eliminado."
  exit 1
fi
