#!/bin/bash
#
# actualiza.sh
# Actualiza paquetes de Debian y realiza limpieza posterior
# Uso: ./actualiza.sh
#

set -euo pipefail

echo "🔄 Actualizando lista de paquetes..."
sudo apt update

echo "⬆️ Actualizando paquetes instalados..."
sudo apt upgrade -y

echo "🧼 Limpiando paquetes huérfanos y caché..."
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean -y

echo "✅ Sistema actualizado y limpio."

# Notificación de escritorio (si libnotify-bin está instalado)
if command -v notify-send >/dev/null 2>&1; then
  notify-send "Actualización completa" "Sistema actualizado y optimizado ✅"
fi

exit 0
