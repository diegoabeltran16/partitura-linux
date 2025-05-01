#!/bin/bash
# install-privacy.sh - Instalador inicial de herramientas de privacidad para Debian XFCE

# Requiere permisos de superusuario
if [[ $EUID -ne 0 ]]; then
  echo "Este script debe ejecutarse como root (sudo)"
  exit 1
fi

### 🧩 Actualización del sistema
echo "🔄 Actualizando sistema..."
apt update && apt upgrade -y

### 🔐 Herramientas de privacidad a instalar
PACKAGES=(
  gnupg \
  pinentry-gtk2 \
  veracrypt \
  tor \
  curl \
  wget
)

echo "📦 Instalando herramientas de privacidad..."
apt install -y "${PACKAGES[@]}"

### 🛠️ Configuración mínima

# Crear carpeta para montajes de Veracrypt
mkdir -p /mnt/secure
chown "$SUDO_USER":"$SUDO_USER" /mnt/secure

# Permitir a Tor iniciar automáticamente si se desea
systemctl enable tor.service

### ✅ Resultado final
echo "✅ Instalación completa."
echo "Puedes ejecutar Veracrypt desde menú, y Tor ya está disponible."
echo "GPG está listo para usarse (gpg --full-generate-key)."
echo "Recuerda configurar alias útiles en ~/.bashrc si querés rapidez."

exit 0
