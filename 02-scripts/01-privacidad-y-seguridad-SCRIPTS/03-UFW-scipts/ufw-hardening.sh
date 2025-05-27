#!/usr/bin/env bash
# =============================================================================
# 🔐 ufw-hardening.sh — Endurecimiento básico de firewall con UFW
#
# 🧠 Propósito:
#   Aplicar un conjunto mínimo de reglas de seguridad en UFW para
#   proteger sistemas Debian/Ubuntu contra escaneos y accesos no deseados.
#
# 📚 ¿Qué aprenderás?:
#   - Configurar políticas por defecto seguras
#   - Bloquear puertos inseguros comunes
#   - Habilitar logging para auditoría
#   - Desactivar servicios innecesarios (CUPS, Avahi)
#
# 📦 Requisitos:
#   - Debes tener instalado UFW y systemd
#   - Ejecutar como root o con sudo
#
# 🛠️ Uso:
#   1. Copia este archivo como ufw-hardening.sh
#   2. Hazlo ejecutable: chmod +x ufw-hardening.sh
#   3. Ejecútalo: sudo ./ufw-hardening.sh
#
# ✍️ Autor: Naveen | 💻 Debian XFCE | 📅 Fecha: 2025-05-25
# =============================================================================

# ------------------------ FUNCIONES AUXILIARES ------------------------

# Ejecuta un comando y muestra un mensaje
run() {
    local msg="$1"
    shift
    echo -e "\n-> $msg"
    "$@" || echo "[ERROR] Falló: $*"
}

# Comprueba dependencias mínimas
check_deps() {
    for cmd in ufw systemctl; do
        if ! command -v "$cmd" &>/dev/null; then
            echo "[ERROR] Falta '$cmd'. Instálalo antes de continuar." >&2
            exit 1
        fi
    done
}

# ------------------------ ENDURECIMIENTO UFW ------------------------

check_deps

echo "# Iniciando endurecimiento de firewall con UFW..."  

# 1) Reiniciar configuración a estado limpio
run "Restablecer UFW a configuración por defecto" ufw --force reset

# 2) Políticas seguras por defecto
run "Definir política: denegar todo tráfico entrante" ufw default deny incoming
run "Definir política: permitir todo tráfico saliente" ufw default allow outgoing

# 3) Bloquear puertos inseguros o innecesarios
#    Lista de puertos típicos a negar
ports=(
    25/tcp    # SMTP (correo)
    631/tcp   # CUPS (impresión)
    5353/udp  # mDNS (Avahi)
    69/udp    # TFTP
    137:139/tcp  # NetBIOS
    445/tcp   # SMB
    111/tcp   # RPCbind
    111/udp   # RPCbind
    2049/tcp  # NFS
)
for p in "${ports[@]}"; do
    run "Bloquear puerto $p" ufw deny "$p"
done

# 4) Habilitar logging para auditoría básica
run "Activar logging de UFW (nivel medio)" ufw logging medium

# 5) Activar firewall si no lo está
run "Habilitar UFW" ufw enable

# ------------------------ DESACTIVAR SERVICIOS ------------------------

echo -e "\n# Deshabilitando servicios no esenciales..."
# Lista de servicios a detener y deshabilitar
disable_services=(
    cups     # demonio de impresión
    cups-browsed
    avahi-daemon
)
for svc in "${disable_services[@]}"; do
    run "Detener servicio $svc" systemctl stop "$svc" 2>/dev/null
    run "Deshabilitar $svc en arranque" systemctl disable "$svc" 2>/dev/null
done

# ------------------------ RESUMEN FINAL ------------------------

echo -e "\n# Resumen de estado:\n"
echo "UFW status:"  
sudo ufw status verbose

echo -e "\nServicios activos listening:"  
sudo netstat -tuln

echo -e "\nEndurecimiento completado. Mantén tus scripts y logs actualizados."
