#!/bin/bash

################################################################################
# 🔐 cifrar_inteligente.sh
# Cifra un archivo individual o todos los .txt de una carpeta usando GPG + Ed25519
# Detecta si el argumento es un archivo o un directorio y actúa en consecuencia
# Naveen, Debian XFCE - Proyecto Pedagógico Post-Cuántico
################################################################################

# 👤 Configura tu nombre de clave de firma Ed25519
FIRMA="firma aca"

# 🛑 Verificar si se pasó un argumento
if [ -z "$1" ]; then
    echo "❌ Uso: $0 <archivo.txt | carpeta>"
    exit 1
fi

# 📂 Procesar si es un directorio
if [ -d "$1" ]; then
    echo "📁 Procesando carpeta: $1"
    for archivo in "$1"/*.txt; do
        if [ -f "$archivo" ]; then
            base=$(basename "$archivo" .txt)
            salida="$1/${base}.asc"

            echo "🔐 Cifrando $archivo → $salida"
            gpg --armor --batch --yes \
                --sign --local-user "$FIRMA" \
                --cipher-algo AES256 \
                --symmetric "$archivo" \
                -o "$salida"

            if [ $? -eq 0 ]; then
                echo "✅ Éxito: $salida"
            else
                echo "❌ Falló el cifrado de $archivo"
            fi
        fi
    done
    echo "🎉 Todos los archivos en '$1' han sido procesados."
    exit 0
fi

# 📄 Procesar si es un archivo individual
if [ -f "$1" ]; then
    base=$(basename "$1" | cut -d. -f1)
    salida="${base}.asc"

    echo "🔐 Cifrando archivo: $1 → $salida"
    gpg --armor --batch --yes \
        --sign --local-user "$FIRMA" \
        --cipher-algo AES256 \
        --symmetric "$1" \
        -o "$salida"

    if [ $? -eq 0 ]; then
        echo "✅ Éxito: $salida"
    else
        echo "❌ Falló el cifrado de $1"
    fi
    exit 0
fi

# 🚫 Si no es archivo ni carpeta
echo "❌ '$1' no es un archivo ni una carpeta válida."
exit 1
