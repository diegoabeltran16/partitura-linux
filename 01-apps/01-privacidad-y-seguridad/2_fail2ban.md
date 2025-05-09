# 🛡️ ¿Qué es `fail2ban`?

**`fail2ban`** es una herramienta de seguridad que **monitorea logs** del sistema en busca de **intentos de acceso fallidos o sospechosos** (como múltiples contraseñas incorrectas) y **bloquea automáticamente las IPs que los provocan**, usando reglas de *firewall* (iptables o firewalld).

---

## 📌 Casos típicos de uso

- Proteger **servidores SSH** de intentos de login por fuerza bruta.
  
- Bloquear intentos fallidos en servicios como:
  
  - FTP (`vsftpd`, `proftpd`)
    
  - SMTP / correo (`postfix`, `dovecot`)
    
  - Web (Apache, Nginx)
    
  - WordPress, phpMyAdmin, etc.
    
- Reducir la superficie de ataque en servidores expuestos a internet.
  

---

## ⚙️ ¿Cómo funciona?

1. Lee los **logs de un servicio** (como `/var/log/auth.log`).
  
2. Detecta **múltiples fallos** desde una misma IP (ej. 5 intentos en 10 min).
  
3. Ejecuta una acción: típicamente, **bloquear esa IP temporalmente** con el firewall.
  

---

## 🧪 Ejemplo básico

Una vez instalado (`sudo apt install fail2ban` o `dnf install fail2ban`), puedes proteger SSH así:

```bash
sudo systemctl enable --now fail2ban
```

Archivo de configuración general:

```bash
/etc/fail2ban/jail.conf (nunca editar este directamente)
```

Usar este mejor:

```bash
/etc/fail2ban/jail.local
```

Ejemplo para SSH:

```ini
[sshd] enabled = true port = ssh logpath = %(sshd_log)s maxretry = 5 bantime = 600 findtime = 600
```

Este bloquea IPs que fallen 5 veces en 10 minutos por 10 minutos.

---

## 🕵️ Herramientas útiles

- Ver jails activas:
  
  ```bash
  sudo fail2ban-client status
  ```

- Ver IPs bloqueadas en una jail:
  
  ```bash
  sudo fail2ban-client status sshd
  ```

- Desbloquear IP manualmente:
  
  ```bash
  sudo fail2ban-client set sshd unbanip 1.2.3.4
  ```

---

## 🧠 Ventajas

- Muy **ligero y fácil de configurar**.
  
- **Automatiza la defensa** sin intervención humana.
  
- Compatible con muchos servicios.
  
- Se puede integrar con firewalld, iptables o incluso enviar notificaciones por correo.