#!/bin/bash
# install-privacy.sh - Instalador inicial de herramientas de privacidad para Debian XFCE

# Requiere permisos de superusuario (Este codigo solicita los permisos sudo para ejecutar script)
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
  wget \
  ufw \
  fail2ban \
  rkhunter \
  chkrootkit \
  clamav \
  clamtk \
  auditd \
  logwatch \
  trivy \
  apparmor-utils
)

echo "📦 Instalando herramientas de privacidad y seguridad..."
apt install -y "${PACKAGES[@]}"

### 🛠️ Configuración mínima

# Crear carpeta para montajes de Veracrypt
mkdir -p /mnt/secure
chown "$SUDO_USER":"$SUDO_USER" /mnt/secure

# Permitir a Tor iniciar automáticamente si se desea
systemctl enable tor.service

# Activar firewall
ufw enable

### ✅ Resultado final
echo "✅ Instalación completa."
echo "🔒 Herramientas de seguridad como UFW, Fail2Ban, ClamAV están listas."
echo "🔐 Puedes ejecutar Veracrypt desde menú, y Tor ya está disponible."
echo "🧠 GPG está listo para usarse (gpg --full-generate-key)."
echo "🧹 Recomendado configurar alias y escaneos periódicos."

exit 0
