#!/usr/bin/env bash
#
# init-onedrive-rclone.sh
# Instalación de rclone + configuración de remote + servicio systemd de usuario
#

set -euo pipefail

# ─── Variables ─────────────────────────────────────────────
RCLONE_URL="https://rclone.org/install.sh"
TMP_SCRIPT="$(mktemp)"
trap 'rm -f "$TMP_SCRIPT"' EXIT

# Usamos un directorio de logs en tu HOME para no necesitar sudo
LOGDIR="$HOME/.local/log"
LOGFILE="$LOGDIR/rclone-setup.log"

MOUNT_DIR="$HOME/OneDrive"
SERVICE_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$SERVICE_DIR/rclone-onedrive.service"

# ─── Preparar carpeta de logs ──────────────────────────────
mkdir -p "$LOGDIR"

# ─── Función: Verificar si rclone ya está instalado ────────
check_rclone_installed() {
    if command -v rclone &>/dev/null; then
        echo "✅ Rclone ya está instalado: $(rclone version | head -n 1)"
        return 0
    else
        echo "❌ Rclone no está instalado."
        return 1
    fi
}

# ─── Función: Descargar y ejecutar script oficial ──────────
install_or_update_rclone() {
    echo "🔄 Descargando instalador oficial de rclone..."
    curl -fsSL "$RCLONE_URL" -o "$TMP_SCRIPT"

    echo "⚙️  Ejecutando instalador..."
    # Aquí redirigimos tanto stdout como stderr a tu log en HOME
    sudo bash "$TMP_SCRIPT" 2>&1 | tee -a "$LOGFILE"

    echo "✅ Instalación/actualización completada: $(rclone version | head -n 1)"
}

# ─── 1) Instalar o actualizar rclone ───────────────────────
echo "🔧 Iniciando instalación/actualización de rclone..."
if check_rclone_installed; then
    read -rp "¿Deseas actualizar rclone? (s/N): " confirm
    if [[ "$confirm" =~ ^[sS]$ ]]; then
        install_or_update_rclone
    else
        echo "➡️  Se mantiene la versión actual."
    fi
else
    install_or_update_rclone
fi

# ─── 2) Configurar remote de OneDrive ─────────────────────
echo
echo "🔑 Configura tu remote de OneDrive:"
echo "   1) Elige 'n' para nuevo remote."
echo "   2) Ponle nombre 'onedrive'."
echo "   3) Selecciona 'Microsoft OneDrive'."
echo "   4) Autoriza en el navegador y pega el token."
rclone config

# ─── 3) Preparar punto de montaje ──────────────────────────
echo
echo "📁 Creando directorio de montaje en: $MOUNT_DIR"
mkdir -p "$MOUNT_DIR"

# ─── 4) Crear servicio systemd de usuario ──────────────────
echo
echo "🔧 Configurando servicio systemd de usuario para montaje automático..."
mkdir -p "$SERVICE_DIR"
cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=Montaje de OneDrive usando rclone
After=network-online.target

[Service]
Type=notify
ExecStart=/usr/bin/rclone mount \\
  --config \$HOME/.config/rclone/rclone.conf \\
  --vfs-cache-mode writes \\
  onedrive: \$HOME/OneDrive
ExecStop=/usr/bin/fusermount -u \$HOME/OneDrive
Restart=on-failure

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable rclone-onedrive
systemctl --user start  rclone-onedrive

echo
echo "🎉 ¡Todo listo! Tu OneDrive se montará en '$MOUNT_DIR' automáticamente al iniciar sesión."
