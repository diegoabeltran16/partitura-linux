#!/bin/bash

################################################################################
# 🔐 cifrar_SMART.sh — Cifrado Simétrico + Firma (Ed25519, RSA o ambas)
#
# 🧠 Propósito:
# Este script cifra uno o varios archivos de texto plano con GnuPG:
#   - Cifrado simétrico fuerte (AES256)
#   - Firma digital opcional con Ed25519, RSA o ambas
#   - Solicita la clave de cifrado una vez (usada en todos los archivos)
#   - Desbloquea claves de firma antes del proceso para evitar múltiples prompts
#   - Ofrece eliminación segura del original con shred
#
# ✍️ Autor: Naveen | 💻 Debian XFCE | 📦 Requiere: GnuPG, shred (coreutils)
################################################################################

# === PASO 1️⃣ — Verificar argumento de entrada
TARGET="$1"
if [ -z "$TARGET" ]; then
    echo "❌ Uso: $0 <archivo.txt | carpeta>"
    exit 1
fi

# === PASO 2️⃣ — Menú interactivo para tipo de firma
echo ""
echo "🧠 ¿Con qué clave deseas firmar los archivos (opcional)?"
echo "  1. 🧬 Ed25519"
echo "  2. 🔐 RSA"
echo "  3. 🧪 Ambas (Ed25519 + RSA)"
echo "  4. 🚫 No firmar"
read -p "👉 Selecciona una opción [1/2/3/4]: " OPCION_FIRMA

# === PASO 3️⃣ — Buscar claves correspondientes
CLAVE_ED=$(gpg --list-secret-keys --with-colons | awk -F: '$1=="sec" && $4=="22" {print $5; exit}')
CLAVE_RSA=$(gpg --list-secret-keys --with-colons | awk -F: '$1=="sec" && $4=="1" {print $5; exit}')

# === PASO 4️⃣ — Configurar firma según selección
exportar_clave_si_falta() {
    local ID="$1"
    if ! gpg --list-keys "$ID" &>/dev/null; then
        echo "🔧 Exportando clave pública faltante: $ID"
        gpg --export --armor "$ID" | gpg --import
    fi
}

case "$OPCION_FIRMA" in
    1)
        if [ -z "$CLAVE_ED" ]; then
            echo "❌ No se encontró clave Ed25519"
            exit 1
        fi
        exportar_clave_si_falta "$CLAVE_ED"
        FIRMAS=(--sign --local-user "$CLAVE_ED")
        ;;
    2)
        if [ -z "$CLAVE_RSA" ]; then
            echo "❌ No se encontró clave RSA"
            exit 1
        fi
        exportar_clave_si_falta "$CLAVE_RSA"
        FIRMAS=(--sign --local-user "$CLAVE_RSA")
        ;;
    3)
        if [ -z "$CLAVE_ED" ] || [ -z "$CLAVE_RSA" ]; then
            echo "❌ No se encontraron ambas claves necesarias."
            exit 1
        fi
        exportar_clave_si_falta "$CLAVE_ED"
        exportar_clave_si_falta "$CLAVE_RSA"
        FIRMAS=(--sign --local-user "$CLAVE_ED" --sign --local-user "$CLAVE_RSA")
        ;;
    4)
        FIRMAS=()
        ;;
    *)
        echo "❌ Opción inválida"
        exit 1
        ;;
esac

# === PASO 5️⃣ — Pedir clave de cifrado (siempre, independientemente de si firmas)
read -s -p "🔐 Ingresa la clave de cifrado: " MI_CLAVE
echo ""
read -s -p "🔐 Confirma la clave de cifrado: " MI_CLAVE_CONFIRM
echo ""
if [ "$MI_CLAVE" != "$MI_CLAVE_CONFIRM" ]; then
    echo "❌ Las claves no coinciden. Abortando."
    exit 1
fi

# === PASO 6️⃣ — Desbloquear claves de firma si se usan (evita prompts por archivo)
if [ ${#FIRMAS[@]} -gt 0 ]; then
    echo ""
    echo "⏳ Desbloqueando clave(s) de firma para evitar múltiples solicitudes..."
    echo "temporal" | gpg --quiet --output /dev/null "${FIRMAS[@]}" --sign
    if [ $? -ne 0 ]; then
        echo "❌ No se pudo desbloquear la(s) clave(s) de firma."
        echo "   Asegúrate de ingresar correctamente la passphrase cuando se solicite."
        exit 1
    fi
    echo "✅ Clave(s) desbloqueada(s). Continuando..."
fi

# === PASO 7️⃣ — Función para cifrar un archivo
procesar_archivo() {
    local archivo="$1"
    if file "$archivo" | grep -q 'text'; then
        salida="${archivo}.asc"
        echo "🔐 Cifrando: $archivo → $salida"

        gpg --armor --batch --yes \
            --pinentry-mode loopback \
            --passphrase "$MI_CLAVE" \
            "${FIRMAS[@]}" \
            --cipher-algo AES256 \
            --symmetric \
            --output "$salida" \
            "$archivo"

        if [ $? -eq 0 ]; then
            echo "✅ Éxito: $salida"
            read -p "🧠 ¿Eliminar el archivo original con shred? [s/N]: " respuesta
            if [[ "$respuesta" =~ ^[sS]$ ]]; then
                shred -u "$archivo"
                echo "🗑️ Eliminado de forma segura."
            else
                echo "📂 Archivo original conservado."
            fi
        else
            echo "❌ Falló el cifrado de $archivo"
        fi
    else
        echo "⚠️ Omitido (no es texto): $archivo"
    fi
}

# === PASO 8️⃣ — Procesar archivo o carpeta
if [ -d "$TARGET" ]; then
    echo "📁 Procesando carpeta: $TARGET"
    for archivo in "$TARGET"/*; do
        [ -f "$archivo" ] && procesar_archivo "$archivo"
    done
    echo "🎉 Todos los archivos han sido procesados."
elif [ -f "$TARGET" ]; then
    procesar_archivo "$TARGET"
else
    echo "❌ '$TARGET' no es un archivo ni carpeta válida."
    exit 1
fi
