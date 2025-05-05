#!/bin/bash

################################################################################
# 🔐 descifrar_SMART.sh — Descifrado con validación de firma múltiple
#
# 🧠 Propósito:
# Descifra archivos cifrados con GPG y verifica la firma digital:
#   - Soporta firmas Ed25519, RSA4096 o ambas
#   - Permite definir múltiples claves autorizadas
#   - Detecta si el archivo fue firmado o no
#
# ✍️ Autor: Naveen | 💻 Debian XFCE | 🛠️ Requiere: GPG
################################################################################

# === CONFIGURACIÓN PERSONAL ===
CLAVES_AUTORIZADAS=("D10E6A2E81150B48" "RSAKEYID12345678")  # Puedes agregar más claves aquí

# === 1️⃣ Verificación de argumento ===
if [ -z "$1" ]; then
  echo "❌ Uso: $0 archivo.asc|archivo.tid|carpeta"
  exit 1
fi

archivo_entrada="$1"

# === 2️⃣ Si es carpeta, procesar en lote ===
if [ -d "$archivo_entrada" ]; then
  echo "📁 Procesando carpeta: $archivo_entrada"
  for archivo in "$archivo_entrada"/*.asc; do
    if [ -f "$archivo" ]; then
      echo "\n📂 Procesando archivo: $archivo"
      "$0" "$archivo"
    fi
  done
  echo "🎉 Todos los archivos en '$archivo_entrada' han sido procesados."
  exit 0
fi

# === 3️⃣ Verificación de existencia ===
if [ ! -f "$archivo_entrada" ]; then
  echo "❌ El archivo '$archivo_entrada' no existe."
  exit 1
fi

# === 4️⃣ Si es .tid, extraer bloque PGP ===
if [[ "$archivo_entrada" == *.tid ]]; then
  echo "🧪 Extrayendo bloque GPG del .tid..."
  bloque=$(awk '/-----BEGIN PGP MESSAGE-----/,/-----END PGP MESSAGE-----/' "$archivo_entrada")
  if [[ -z "$bloque" ]]; then
    echo "❌ No se encontró un bloque PGP válido."
    exit 1
  fi

  archivo_temp="$(mktemp)"
  echo "$bloque" > "$archivo_temp"

  titulo=$(awk -F: '/^title:/ {print $2}' "$archivo_entrada" | xargs)
  base="${titulo:-$(basename "$archivo_entrada" | cut -d. -f1)}"
else
  archivo_temp="$archivo_entrada"
  base="$(basename "$archivo_entrada" | cut -d. -f1)"
fi

salida="${base}.txt"

# === 5️⃣ Verificar firma y descifrar ===
echo "🔐 Descifrando..."
gpg_output=$(gpg -d "$archivo_temp" 2>&1 > "$salida")
gpg_exit=$?

if [ $gpg_exit -ne 0 ]; then
  echo "❌ Error al descifrar:\n$gpg_output"
  rm -f "$salida"
  [[ "$archivo_temp" != "$archivo_entrada" ]] && rm -f "$archivo_temp"
  exit 1
fi

# === 6️⃣ Validar firma ===
firma_valida=$(echo "$gpg_output" | grep "Good signature from")
clave_firmante=$(echo "$gpg_output" | grep "Good signature from" | grep -o '[A-F0-9]\{16\}')

if [[ -n "$firma_valida" ]]; then
  match=false
  for clave in "${CLAVES_AUTORIZADAS[@]}"; do
    if [[ "$clave_firmante" == "$clave" ]]; then
      match=true
      break
    fi
  done

  if ! $match; then
    echo "🚫 Firma inválida o no autorizada."
    echo "   Esperado: ${CLAVES_AUTORIZADAS[*]}"
    echo "   Detectado: $clave_firmante"
    rm -f "$salida"
    [[ "$archivo_temp" != "$archivo_entrada" ]] && rm -f "$archivo_temp"
    exit 1
  fi

  echo "✅ Firma verificada correctamente de: $firma_valida"
else
  echo "ℹ️ No se detectó firma verificable (posible modo sign+symmetric)."
  echo "   Descifrado exitoso, pero sin validación de firma."
fi

# === 7️⃣ Confirmación ===
[[ "$archivo_temp" != "$archivo_entrada" ]] && rm -f "$archivo_temp"
echo "📄 Guardado como: $salida"
