#!/bin/bash
#
# optimiza-sistema.sh
# Script de optimización para Debian XFCE en Chromebook Spin 713
# - Limpieza de paquetes y caché
# - Ajuste de swappiness
# - Activación de zram y preload
# - Notificación al finalizar
#

set -euo pipefail

echo "🧼 Limpiando sistema..."
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean -y

echo "🧠 Configurando swappiness a 10..."
echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf >/dev/null
sudo sysctl -p /etc/sysctl.d/99-swappiness.conf

echo "🚀 Instalando/activando zram y preload..."
sudo apt update
sudo apt install -y zram-tools preload
sudo systemctl enable --now zramswap.service preload

echo "🗑️ Limpiando caché de usuario..."
rm -rf ~/.cache/*

echo "✅ Optimización completa."

# Notificación de escritorio (si libnotify-bin está instalado)
if command -v notify-send >/dev/null 2>&1; then
  notify-send "Optimización completa" "Tu Chromebook está afinado ✅"
fi

exit 0
