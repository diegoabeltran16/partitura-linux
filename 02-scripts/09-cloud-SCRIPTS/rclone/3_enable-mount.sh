#!/usr/bin/env bash
#
# 4_enable-mount.sh
# Script interactivo para habilitar, arrancar y verificar servicio de montaje de OneDrive con rclone
#
set -euo pipefail

# Servicio y punto de montaje
SERVICE="rclone-onedrive"
MOUNT_POINT="$HOME/OneDrive"

# Función para sí/no con valor por defecto
ask_yes_no() {
  local prompt="$1"
  local default="${2:-y}"
  local answer
  # Muestra Y/n o y/N según default
  if [[ "$default" == "y" ]]; then
    read -rp "$prompt [Y/n]: " answer
    answer="${answer:-y}"
  else
    read -rp "$prompt [y/N]: " answer
    answer="${answer:-n}"
  fi
  case "$answer" in
    [yY]*) return 0 ;;  *) return 1 ;;
  esac
}

echo
echo "=== Enable & Start: OneDrive mount via rclone ==="
echo

# 1) Habilitar servicio al iniciar sesión
if ask_yes_no "¿Deseas habilitar el servicio '$SERVICE' al iniciar sesión?" "y"; then
  systemctl --user enable "$SERVICE"
  echo "✔ Servicio habilitado."
else
  echo "✖ No se habilitó el servicio."
fi

echo
# 2) Iniciar servicio ahora
if ask_yes_no "¿Arrancar ahora el servicio '$SERVICE'?" "y"; then
  systemctl --user start "$SERVICE"
  echo "✔ Servicio iniciado."
else
  echo "✖ Servicio no iniciado."
fi

echo
# 3) Mostrar estado del servicio
if ask_yes_no "¿Mostrar estado del servicio '$SERVICE'?" "y"; then
  systemctl --user status "$SERVICE" --no-pager
fi

echo
# 4) Ver logs en tiempo real
if ask_yes_no "¿Ver logs en tiempo real del servicio?" "n"; then
  echo "¡Presiona Ctrl+C para salir de los logs!"
  journalctl --user -u "$SERVICE" -f
fi

echo
echo "=== Operación completada ==="
