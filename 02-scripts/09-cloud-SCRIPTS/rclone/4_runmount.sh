#!/usr/bin/env bash
#
# 4_run-mount.sh
# Script interactivo para montar manualmente un remote de rclone
#
set -euo pipefail

# ── Función para preguntar con valor por defecto ───────────
ask() {
  local prompt="$1"
  local default="$2"
  local answer
  read -rp "$prompt [$default]: " answer
  [[ -z "$answer" ]] && echo "$default" || echo "$answer"
}

# ── 1) Introducción ───────────────────────────────────────
echo
echo "=== Montaje interactivo de un remote con rclone ==="
echo

# ── 2) Parámetros de montaje ──────────────────────────────
remote=$(ask "Nombre del remote a montar" "onedrive")
remote_path=$(ask "Ruta dentro del remote (vacío=raíz)" "")
mount_point=$(ask "Directorio local donde montar" "$HOME/OneDrive")

# Crear mount point si no existe
action=""
if [[ ! -d "$mount_point" ]]; then
  read -rp "El directorio '$mount_point' no existe. ¿Crear? [Y/n]: " action
  action=${action:-Y}
  if [[ "$action" =~ ^[Yy] ]]; then
    mkdir -p "$mount_point"
    echo "✔ Directorio creado: $mount_point"
  else
    echo "✖ No se creó el directorio. Abortando."
    exit 1
  fi
fi

echo
# ── 3) Opciones de rclone mount ───────────────────────────
echo "Configura flags de rclone mount (Enter = valor por defecto):"
vfs_cache_mode=$(ask "Modo VFS cache (off|minimal|writes|full)" "writes")
buffer_size=$(ask "Tamaño de buffer de lectura (p.ej. 512M)" "512M")
bwlimit=$(ask "Límite de ancho de banda (p.ej. 5M) o vacío" "")
read_chunk=$(ask "Chunk inicial de lectura (--vfs-read-chunk-size)" "")

echo
# Construir array de opciones
RCLONE_OPTS=(
  --config "$HOME/.config/rclone/rclone.conf"
  --vfs-cache-mode "$vfs_cache_mode"
  --buffer-size "$buffer_size"
)
[[ -n "$bwlimit" ]] && RCLONE_OPTS+=( --bwlimit "$bwlimit" )
[[ -n "$read_chunk" ]] && RCLONE_OPTS+=( --vfs-read-chunk-size "$read_chunk" )

echo "Opciones seleccionadas de rclone mount: ${RCLONE_OPTS[*]}"
echo

# ── 4) Modo de montaje ────────────────────────────────────
read -rp "Montar en background? [Y/n]: " bg_confirm
bg_confirm=${bg_confirm:-Y}
if [[ "$bg_confirm" =~ ^[Yy] ]]; then
  background=true
else
  background=false
fi

echo
# ── 5) Ejecutar montaje ───────────────────────────────────
echo "Ejecutando comando:" 
if $background; then
  nohup rclone mount "${RCLONE_OPTS[@]}" "$remote:$remote_path" "$mount_point" >/dev/null 2>&1 &
  echo "✔ Montaje iniciado en background (PID $!)."
  echo "Usa 'systemctl --user start rclone-onedrive' o 'nohup' para gestionarlo, o 'fusermount -u $mount_point' para desmontar."  
else
  rclone mount "${RCLONE_OPTS[@]}" "$remote:$remote_path" "$mount_point"
fi

echo "\n=== Montaje finalizado (o en ejecución en background) ==="
