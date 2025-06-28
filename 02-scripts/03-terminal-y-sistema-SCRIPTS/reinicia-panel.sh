#!/bin/bash
# 
# reinicia-panel.sh
# Reinicia el panel XFCE para liberar RAM y refrescar iconos
#

set -euo pipefail

echo "🔄 Reiniciando panel XFCE..."
xfce4-panel --restart

echo "✅ Panel XFCE reiniciado."

# Notificación de escritorio (si libnotify-bin está instalado)
if command -v notify-send >/dev/null 2>&1; then
  notify-send "Panel XFCE" "Reiniciado correctamente ✅"
fi

exit 0
