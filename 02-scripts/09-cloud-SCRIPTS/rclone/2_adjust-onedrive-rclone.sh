#!/usr/bin/env bash
#
# adjust-onedrive-rclone.sh
# Script interactivo para reconfigurar el montaje de OneDrive con rclone
#
set -euo pipefail

# ── Configuración fija ─────────────────────────────────────
REMOTE="onedrive"
MOUNT_POINT="$HOME/OneDrive"
SYSTEMD_SVC="rclone-onedrive"
UNIT_FILE="$HOME/.config/systemd/user/${SYSTEMD_SVC}.service"

# ── Función para preguntar con valor por defecto ───────────
ask() {
  local prompt="$1"
  local default="$2"
  local answer
  read -rp "$prompt [$default]: " answer
  if [[ -z "$answer" ]]; then
    echo "$default"
  else
    echo "$answer"
  fi
}

# ── 1) Mostrar explicaciones y opciones ───────────────────
echo "Configura las opciones de montaje para OneDrive:"

echo "\n1) Modo VFS cache (controla caché local de archivos):"
echo "   off     - Sin cache local"
echo "   minimal - Cache de metadatos y lecturas parciales"
echo "   writes  - Cache solo de escrituras (por defecto)"
echo "   full    - Cache completa (lectura y escritura)"
vfs_cache_mode=$(ask "Selecciona modo de VFS cache" "writes")

echo "\n2) Tamaño de buffer de lectura (RAM usada para buffering):"
echo "   Ejemplos: 128M, 256M, 512M (recomendado), 1G"
buffer_size=$(ask "Tamaño de buffer de lectura" "512M")

echo "\n3) Límite de ancho de banda (transferencia máxima):"
echo "   Ejemplos: 5M para 5 MiB/s, 10M, deja vacío para sin límite"
bwlimit=$(ask "Límite de ancho de banda" "")

echo "\n4) Chunk inicial de lectura (--vfs-read-chunk-size):"
echo "   Ejemplos: 64M, 128M, 256M, deja vacío para usar cache-mode"
read_chunk=$(ask "Chunk inicial de lectura" "")

echo
echo "Se aplicarán las siguientes opciones a tu servicio rclone-onedrive:" 
printf "  %s\n" "--vfs-cache-mode ${vfs_cache_mode}" "--buffer-size ${buffer_size}" "\${bwlimit:+--bwlimit ${bwlimit}}" "\${read_chunk:+--vfs-read-chunk-size ${read_chunk}}"
echo

# ── 2) Construir array de opciones ─────────────────────────
RCLONE_OPTS=(
  --vfs-cache-mode "$vfs_cache_mode"
  --buffer-size     "$buffer_size"
)

# Sólo añade bwlimit si no está vacío
if [[ -n "$bwlimit" ]]; then
  RCLONE_OPTS+=( --bwlimit "$bwlimit" )
fi

# Sólo añade read-chunk-size si no está vacío
if [[ -n "$read_chunk" ]]; then
  RCLONE_OPTS+=( --vfs-read-chunk-size "$read_chunk" )
fi

# ── 3) Generar el unit file actualizado ────────────────────
mkdir -p "$(dirname "$UNIT_FILE")"
cat > "$UNIT_FILE" <<EOF
[Unit]
Description=Montaje de OneDrive via rclone
After=network-online.target

[Service]
Type=notify
ExecStart=/usr/bin/rclone mount \
  --config \$HOME/.config/rclone/rclone.conf \
  ${RCLONE_OPTS[@]/#/  } \
  $REMOTE: $MOUNT_POINT
ExecStop=/usr/bin/fusermount -u $MOUNT_POINT
Restart=on-failure

[Install]
WantedBy=default.target
EOF

# ── 4) Recargar y reiniciar el servicio ────────────────────
systemctl --user daemon-reload
systemctl --user restart "$SYSTEMD_SVC"

echo "✅ Servicio '$SYSTEMD_SVC' reiniciado con éxito."
echo "   - Montaje: $MOUNT_POINT"
echo "   - Opciones: ${RCLONE_OPTS[*]}"
