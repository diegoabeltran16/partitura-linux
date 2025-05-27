#!/usr/bin/env bash
# =============================================================================
# 🔎 ufw-checkup.sh — Revisión rápida de seguridad con UFW
#
# 🧠 Propósito:
#   Mostrar de un vistazo el estado del firewall, puertos abiertos y servicios
#   clave para verificar que tu sistema siga protegido.
#
# 📚 ¿Qué aprenderás?:
#   - Cómo comprobar si UFW está activo y sus reglas
#   - Qué puertos están escuchando conexiones
#   - Cómo ver rápidamente los servicios en ejecución
#
# 📦 Requisitos:
#   - ufw, netstat (o ss), systemctl
#   - Privilegios de superusuario para algunos comandos
#
# 🛠️ Uso:
#   1. Guarda este archivo como ufw-checkup.sh
#   2. Hazlo ejecutable: chmod +x ufw-checkup.sh
#   3. Ejecútalo: sudo ./ufw-checkup.sh
#
# ✍️ Autor: Naveen | 💻 Debian XFCE | 📅 Fecha: 2025-05-25
# =============================================================================

# Función para mostrar y ejecutar comandos con mensaje
run() {
    local msg="$1"; shift
    echo -e "\n→ $msg"
    "$@" || echo "[ERROR] Falló: $*"
}

# Verificar dependencias básicas
for cmd in ufw netstat systemctl; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "[ERROR] Falta '$cmd'. Instálalo antes de continuar." >&2
        exit 1
    fi
done

# Encabezado
echo "============================================"
echo "🔎 UFW Checkup - Estado de seguridad rápida"
echo "============================================"

# 1) Estado de UFW
echo -e "\n🛡️ Estado del firewall (UFW):"
run "Mostrar reglas y estado completo" sudo ufw status verbose

# 2) Puertos en LISTEN
echo -e "\n🔌 Puertos escuchando (solo servidores):"
run "Listar puertos TCP/UDP en LISTEN" sudo netstat -tuln

# 3) Servicios en ejecución
echo -e "\n⚙️ Servicios systemd activos (solo running):"
run "Listar servicios" systemctl list-units --type=service --state=running --no-pager

# 4) Resumen y consejos
cat << 'EOF'

✅ Revisión completada.
- Si ves un puerto abierto que no reconoces, considera bloqueado con ufw.
- Si UFW está inactivo, actívalo: sudo ufw enable
- Mantén tu sistema actualizado y revisa logs en /var/log/ufw.log
Boa prática de segurança!
EOF
