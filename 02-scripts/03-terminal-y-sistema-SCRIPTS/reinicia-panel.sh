#!/bin/bash
#
# reinicia-panel.sh
# Reinicia XFCE panel matando el proceso y arrancándolo de nuevo con el entorno gráfico correcto.
#

set -euo pipefail

# ① Ajusta estas variables según tu sesión X
export DISPLAY="${DISPLAY:-:0}"  
export XAUTHORITY="${XAUTHORITY:-/home/naveen/.Xauthority}"

echo "🔄 Matando proceso de xfce4-panel..."
pkill -x xfce4-panel || true

# ② Esperar a que realmente muera
while pgrep -x xfce4-panel >/dev/null; do
  sleep 0.1
done

sleep 0.5

echo "🚀 Iniciando xfce4-panel en background..."
setsid xfce4-panel >/dev/null 2>&1 < /dev/null &

echo "✅ Panel XFCE reiniciado."

# Notificación
if command -v notify-send >/dev/null 2>&1; then
  notify-send "Panel XFCE" "Reiniciado correctamente ✅"
fi

exit 0
