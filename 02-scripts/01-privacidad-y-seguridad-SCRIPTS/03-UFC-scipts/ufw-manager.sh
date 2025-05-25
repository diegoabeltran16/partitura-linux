#!/usr/bin/env bash
# =============================================================================
# 🔐 ufw-manager.sh — Script interactivo para manejar UFW en Debian XFCE
#
# 🧠 Propósito:
#   Proveer una interfaz sencilla e interactiva para configurar el firewall
#   usando UFW (Uncomplicated Firewall), con explicaciones paso a paso.
#
# 📚 Cómo usar:
#   1. Copia este archivo en tu máquina: ufw-manager.sh
#   2. Hazlo ejecutable: chmod +x ufw-manager.sh
#   3. Ejecútalo como root o con sudo: sudo ./ufw-manager.sh
#   4. Elige la opción deseada en el menú.
#
# ✍️ Autor: Naveen
# 📦 Requiere: ufw instalado y privilegios de superusuario
# =============================================================================
## 🔐 MENÚ PRINCIPAL EXPLICADO
#
# | Opción | Acción | ¿Qué hace? |
# | --- | --- | --- |
# | `1)` | **Inicializar firewall (reset + políticas por defecto)** | 🔄 Restablece completamente la configuración de UFW y aplica estas reglas: - `deny incoming` (bloquea todo el tráfico entrante) - `allow outgoing` (permite todo lo que sale) ✅ Es el punto de partida ideal para trabajar seguro: nada entra a tu sistema salvo lo que tú explícitamente permitas. |
# | `2)` | **Permitir SSH (puerto 22)** | ✅ Abre el puerto 22, necesario si accedes remotamente a tu máquina con `ssh usuario@IP`. Si bloqueas este puerto accidentalmente, puedes quedarte sin acceso remoto. |
# | `3)` | **Permitir HTTP/HTTPS (puertos 80 y 443)** | 🌐 Abre los puertos web clásicos: - `80/tcp` para sitios sin cifrar (HTTP) - `443/tcp` para sitios con SSL/TLS (HTTPS). Útil si estás corriendo un servidor web o usas herramientas que escuchan por esos puertos. |
# | `4)` | **Permitir puerto personalizado** | 🔓 Te permite abrir **cualquier puerto TCP** escribiéndolo tú mismo. Ejemplo: si estás corriendo una app en el puerto `3000`, puedes abrirlo con esta opción. |
# | `5)` | **Denegar puerto personalizado** | 🚫 Lo opuesto al anterior: bloquea un puerto específico. Por ejemplo, puedes cerrar el `25/tcp` (SMTP) si no quieres que nadie intente enviar correos desde tu máquina. |
# | `6)` | **Permitir IP específica** | 🎯 Solo permite conexiones desde **una IP o rango de IPs**. Ejemplo: puedes decir “solo 192.168.1.42 puede conectarse”. Útil para crear listas blancas de acceso. |
# | `7)` | **Mostrar estado de ufw** | 📋 Muestra todas las reglas activas en tu firewall: qué puertos están abiertos, qué IPs están permitidas, etc. También indica si el firewall está **activo o no**. |
# | `8)` | **Desactivar firewall** | 📴 Detiene temporalmente el firewall. ⚠️ Solo debes usar esto si **sabes que no estás expuesto**, ya que deja tu sistema abierto a conexiones externas. |
# | `9)` | **Reiniciar configuración (ufw reset)** | ♻️ Borra todas las reglas definidas y vuelve al estado inicial. Ideal si “te enredaste” con muchas reglas y quieres empezar de cero. |
#
#
# ------------------------ FUNCIONES AUXILIARES ------------------------

# Función para pausar y esperar tecla
pause() {
    read -rp "
Presiona [Enter] para continuar..."
}

# Comprueba si ufw está instalado
check_ufw() {
    if ! command -v ufw &> /dev/null; then
        echo "Error: ufw no está instalado. Instálalo con 'sudo apt-get install ufw'."
        exit 1
    fi
}

# ----------------------------- MENÚ -----------------------------

display_menu() {
    clear
    cat << 'EOF'
🔐 * UFw Manager (Interfaz Interactiva) * 🔐

Elige una opción:

 1) Inicializar firewall (reset + políticas por defecto)
 2) Permitir SSH
 3) Permitir HTTP/HTTPS
 4) Permitir puerto personalizado
 5) Denegar puerto personalizado
 6) Permitir IP específica
 7) Mostrar estado de ufw
 8) Desactivar firewall
 9) Reiniciar configuración (ufw reset)
 0) Salir
EOF
}

# ------------------------ ACCIONES ------------------------

initialize_firewall() {
    echo "\nInicializando firewall..."
    ufw --force reset
    ufw default deny incoming    # Bloquea todo tráfico entrante
    ufw default allow outgoing   # Permite todo tráfico saliente
    echo "Políticas por defecto aplicadas: DENY incoming, ALLOW outgoing."
    pause
}

allow_ssh() {
    echo "\nPermitiendo SSH (puerto 22)..."
    ufw allow OpenSSH
    echo "SSH habilitado."
    pause
}

allow_http_https() {
    echo "\nPermitiendo HTTP (80) y HTTPS (443)..."
    ufw allow 80/tcp
    ufw allow 443/tcp
    echo "HTTP/HTTPS habilitados."
    pause
}

allow_custom_port() {
    read -rp "Ingresa el puerto a permitir: " port
    ufw allow ${port}/tcp
    echo "Puerto ${port}/tcp permitido."
    pause
}

denied_custom_port() {
    read -rp "Ingresa el puerto a denegar: " port
    ufw deny ${port}/tcp
    echo "Puerto ${port}/tcp denegado."
    pause
}

allow_ip() {
    read -rp "Ingresa la IP o rango (ej: 192.168.1.100 o 10.0.0.0/24): " ip
    ufw allow from ${ip}
    echo "Regla: permitir desde ${ip}."
    pause
}

show_status() {
    echo "\nEstado actual de ufw:"
    ufw status verbose
    pause
}

disable_firewall() {
    echo "\nDesactivando ufw..."
    ufw disable
    echo "ufw desactivado."
    pause
}

reset_firewall() {
    echo "\nReiniciando configuración de ufw..."
    ufw --force reset
    echo "Configuración reiniciada a cero."
    pause
}

# ------------------------ BUCLE PRINCIPAL ------------------------

# Verifica dependencias\check_ufw

while true; do
    display_menu
    read -rp "\nSelecciona una opción [0-9]: " choice
    case $choice in
        1) initialize_firewall ;; 
        2) allow_ssh ;; 
        3) allow_http_https ;; 
        4) allow_custom_port ;; 
        5) denied_custom_port ;; 
        6) allow_ip ;; 
        7) show_status ;; 
        8) disable_firewall ;; 
        9) reset_firewall ;; 
        0) echo "Saliendo..."; exit 0 ;; 
        *) echo "Opción inválida. Intenta nuevamente."; pause ;;
    esac
done
