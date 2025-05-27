#!/usr/bin/env bash
# =============================================================================
# 🔍 ufw-service-scanner.sh — Escaneo y defensa interactiva de servicios + UFW
#
# 🧠 Propósito:
#   Detectar servicios que escuchan en puertos comunes, mostrar su función,
#   recomendar acciones de seguridad según el principio de mínimo privilegio,
#   y aplicar detención de servicios y bloqueo de puertos mediante UFW.
#
# 📚 ¿Por qué este script es útil?
#   - Ayuda a identificar fácilmente qué procesos escuchan conexiones externas
#   - Proporciona contexto pedagógico: descripción y riesgo de cada servicio
#   - Permite aplicar recomendaciones seguras sin memorizar comandos complejos
#   - Fortalece tu sistema con reglas UFW consistentes y controladas
#
# 📦 Requisitos:
#   - netstat (o ss) para listar puertos en LISTEN
#   - systemctl para manejar servicios
#   - ufw para bloquear/permitir puertos
#   - Privilegios de superusuario (sudo)
#
# 🛠️ Uso:
#   1. Guarda este archivo: ufw-service-scanner.sh
#   2. Hazlo ejecutable: chmod +x ufw-service-scanner.sh
#   3. Ejecútalo como root o con sudo: sudo ./ufw-service-scanner.sh
#   4. Sigue las indicaciones para revisar y endurecer servicios.
#
# ✍️ Autor: Naveen | 💻 Debian XFCE | 📅 Fecha: 2025-05-25
# =============================================================================

# ------------------------ FUNCIONES AUXILIARES ------------------------

# pause: espera a que el usuario presione Enter antes de continuar
pause() {
    read -rp "\nPresiona [Enter] para continuar..." dummy
}

# check_deps: comprueba que las herramientas necesarias estén disponibles
check_deps() {
    local missing=()
    for cmd in netstat ufw systemctl; do
        if ! command -v "$cmd" &>/dev/null; then
            missing+=("$cmd")
        fi
    done
    if [ ${#missing[@]} -ne 0 ]; then
        echo "Error: faltan las siguientes dependencias: ${missing[*]}" >&2
        echo "Instálalas con: sudo apt-get install <paquete>" >&2
        exit 1
    fi
}

# print_header: limpia pantalla e imprime mensaje de inicio
print_header() {
    clear
    echo -e "🔍 Iniciando escaneo de servicios...\n"
}

# ------------------------ DATOS DE SERVICIOS -------------------------
# Definimos qué servicios inspeccionamos, sus puertos y recomendaciones.

# svc_port_map: asocia cada servicio con su puerto estándar
declare -A svc_port_map=(
    [cupsd]=631
    [postfix]=25
    [exim4]=25
    [avahi-daemon]=5353
    [sshd]=22
    [nginx]=80
    [apache2]=80
    [mysqld]=3306
    [mariadbd]=3306
    [smbd]=445
    [vsftpd]=21
    [openvpn]=1194
)

# svc_desc_map: breve descripción pedagógica de cada servicio
declare -A svc_desc_map=(
    [cupsd]="Sistema de impresión local (CUPS)"
    [postfix]="Servidor de correo saliente (SMTP)"
    [exim4]="Servidor de correo saliente (SMTP)"
    [avahi-daemon]="Descubrimiento de dispositivos en red local (mDNS)"
    [sshd]="Acceso remoto seguro (SSH)"
    [nginx]="Servidor web HTTP"
    [apache2]="Servidor web HTTP"
    [mysqld]="Base de datos MySQL"
    [mariadbd]="Base de datos MariaDB"
    [smbd]="Compartición de archivos estilo Windows (Samba)"
    [vsftpd]="Servidor FTP no cifrado"
    [openvpn]="Servidor VPN seguro"
)

# svc_ufw_map: recomendación clara y concisa para UFW y systemctl
declare -A svc_ufw_map=(
    [cupsd]="🔒 Desactiva CUPS y bloquea puerto 631/tcp (si no imprimes)"
    [postfix]="🔒 Desactiva Postfix y bloquea puerto 25/tcp (si no envías correos)"
    [exim4]="🔒 Desactiva Exim4 y bloquea puerto 25/tcp"
    [avahi-daemon]="🔒 Bloquea puerto 5353/udp (si no compartes servicios locales)"
    [sshd]="✅ Permite SSH solo desde tu IP y con llave pública"
    [nginx]="✅ Permite HTTP en 80/tcp solo si sirves sitios web; si no, bloquéalo"
    [apache2]="✅ Permite HTTP en 80/tcp solo si sirves sitios web; si no, bloquéalo"
    [mysqld]="🔒 Bloquea 3306/tcp externamente; usar solo localhost"
    [mariadbd]="🔒 Bloquea 3306/tcp externamente; usar solo localhost"
    [smbd]="🔒 Bloquea puertos 139 y 445/tcp (si no usas Samba)"
    [vsftpd]="🔒 Desactiva FTP; usa SFTP sobre SSH"
    [openvpn]="✅ Permite VPN en 1194/udp solo si utilizas OpenVPN"
)

# ------------------------ LÓGICA PRINCIPAL --------------------------

# 1) Verificar dependencias y encabezado
check_deps
print_header

# 2) Obtener lista de servicios en estado LISTEN
#    netstat -tulpn lista TCP/UDP con PID y programa (requiere sudo)
mapfile -t listeners < <(sudo netstat -tulpn 2>/dev/null | grep LISTEN)

# Salir si no hay nada escuchando
if [ ${#listeners[@]} -eq 0 ]; then
    echo "✅ Ningún servicio escuchando detectado. No hay riesgos inmediatos."
    exit 0
fi

# 3) Procesar cada servicio una sola vez (evitar duplicados IPv4/IPv6)
declare -A processed=()

for line in "${listeners[@]}"; do
    # Extraer campos importantes de la línea de netstat
    proto=$(awk '{print $1}' <<<"$line")           # Ej: tcp, udp, tcp6
    local_addr=$(awk '{print $4}' <<<"$line")       # Ej: 127.0.0.1:631
    port=${local_addr##*:}                            # Extrae número de puerto
    prog=$(awk '{print $7}' <<<"$line")             # Ej: 1234/cupsd
    svc=${prog#*/}                                    # Nombre del servicio

    # Normalizar protocolo para UFW (tcp6 → tcp, udp6 → udp)
    proto_clean=${proto/tcp6/tcp}
    proto_clean=${proto_clean/udp6/udp}

    # Si es un servicio conocido y no procesado aún
    if [[ -n "${svc_port_map[$svc]}" && -z "${processed[$svc]}" ]]; then
        # Mostrar información pedagógica
        echo -e "\n⚠️  Servicio detectado: $svc"
        echo "   • Descripción: ${svc_desc_map[$svc]}"
        echo "   • Puerto: $port/$proto"
        echo "   • Recomendación: ${svc_ufw_map[$svc]}"

        # Preguntar al usuario si aplicar la recomendación
        read -rp "   ¿Deseas aplicar esta acción? [s/N]: " answer
        if [[ "$answer" =~ ^[sS]$ ]]; then
            echo "   • Deteniendo servicio '$svc'..."
            sudo systemctl stop "$svc" 2>/dev/null || \
                echo "   ⚠️  No se pudo detener $svc (quizá no exista)"

            echo "   • Deshabilitando '$svc' en el arranque..."
            sudo systemctl disable "$svc" 2>/dev/null || true

            echo "   • Bloqueando puerto $port en UFW..."
            sudo ufw deny "$port/$proto_clean" 2>/dev/null || \
                echo "   ⚠️  Error al bloquear puerto $port/$proto_clean"

            echo "   ✅ Acción completada para $svc."
        else
            echo "   🚫 Se mantiene '$svc' sin cambios."
        fi

        # Marcar como procesado para no repetir IPv6/IPv4
        processed[$svc]=1
    fi

done

# 4) Mensaje de fin y sugerencias adicionales
cat << 'EOF'

🎉 Escaneo y recomendaciones finalizados.
- Verifica reglas de UFW con: ufw status verbose
- Revisa servicios activos: netstat -tuln
- Ajusta manualmente si necesitas exponer algún servicio.
Buen trabajo, ninja de la seguridad! 🥷
EOF
