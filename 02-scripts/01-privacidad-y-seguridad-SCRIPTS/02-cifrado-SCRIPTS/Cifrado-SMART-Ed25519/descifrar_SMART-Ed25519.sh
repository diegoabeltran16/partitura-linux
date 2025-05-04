#!/bin/bash

################################################################################
# 🔓 descifrar_inteligente.sh
# Descifra un archivo .asc/.tid o todos los .asc en una carpeta
# Solo acepta archivos firmados con una clave específica Ed25519
# Naveen - Debian XFCE - Proyecto Pedagógico
################################################################################

# 👤 ID corto de tu clave Ed25519 autorizada
FIRMA_AUTORIZADA="F3B79C1D"  # <- Cambiar por tu fingerprint corto

# 🛑 Verificar argumento
if [ -z "$1" ]; then
    echo "❌ Uso: $0 <archivo.asc | archivo.tid | carpeta>"
    exit 1
fi

# 📦 Función para descifrar un archivo
descifrar_archivo() {
    archivo="$1"
    base=$(basename "$archivo" | cut -d. -f1)
    salida="${base}.txt"

    # Si es .tid, extraer bloque PGP
    if [[ "$archivo" == *.tid ]]; then
        bloque=$(awk '/-----BEGIN PGP MESSAGE-----/,/-----END PGP MESSAGE-----/' "$archivo")
        if [[ -z "$bloque" ]]; then
            echo "❌ No se encontró bloque PGP en $archivo"
            return
        fi
        archivo_temp=$(mktemp)
        echo "$bloque" > "$archivo_temp"
    else
        archivo_temp="$archivo"
    fi

    echo "🔓 Descifrando $archivo..."
    gpg_output=$(gpg -d "$archivo_temp" 2>&1 > "$salida")
    gpg_exit=$?

    if [ $gpg_exit -ne 0 ]; then
        echo "❌ Error al descifrar $archivo"
        rm -f "$salida"
        [[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
        return
    fi

    firma_valida=$(echo "$gpg_output" | grep "Good signature from")
    clave_firmante=$(echo "$gpg_output" | grep "using EDDSA key" | grep -o '[A-F0-9]\{8\}$')

    if [[ -z "$firma_valida" || "$clave_firmante" != "$FIRMA_AUTORIZADA" ]]; then
        echo "🚫 Firma inválida o no autorizada en $archivo"
        rm -f "$salida"
        [[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
        return
    fi

    [[ "$archivo_temp" != "$archivo" ]] && rm -f "$archivo_temp"
    echo "✅ $archivo verificado y descifrado como $salida"
}

# 📂 Si es carpeta
if [ -d "$1" ]; then
    echo "📁 Procesando carpeta: $1"
    for archivo in "$1"/*.{asc,tid}; do
        [ -f "$archivo" ] && descifrar_archivo "$archivo"
    done
    echo "🎉 Todos los archivos en '$1' han sido procesados."
    exit 0
fi

# 📄 Si es archivo individual
if [ -f "$1" ]; then
    descifrar_archivo "$1"
    exit 0
fi

# 🚫 Entrada inválida
echo "❌ '$1' no es archivo ni carpeta válida."
exit 1
