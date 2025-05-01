#!/bin/bash

AUTOSTART_DIR="$HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"

# Crear lanzador para Tor
cat <<EOF > "$AUTOSTART_DIR/tor.desktop"
[Desktop Entry]
Type=Application
Exec=tor
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Tor Background Service
Comment=Start Tor automatically on session start
EOF

# Crear lanzador para Veracrypt GUI (si se desea iniciar al comienzo)
cat <<EOF > "$AUTOSTART_DIR/veracrypt.desktop"
[Desktop Entry]
Type=Application
Exec=veracrypt
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Veracrypt
Comment=Interfaz gráfica de cifrado
EOF

echo "✅ Autoarranque configurado para Tor y Veracrypt."
exit 0
