# 🕵️‍♂️ ¿Qué es `rkhunter`?

**`rkhunter`** significa **Rootkit Hunter**. Es una herramienta de **detección de rootkits y malware en sistemas Unix/Linux**, que escanea el sistema en busca de **comportamientos sospechosos, archivos alterados o binarios comprometidos**.

👉 A diferencia de un antivirus tradicional, `rkhunter` **no analiza archivos individualmente buscando virus**, sino que revisa si el sistema ha sido alterado a nivel profundo.

---

## 🧠 ¿Qué detecta?

- **Rootkits conocidos** (colección de herramientas que un atacante usa para esconderse en el sistema)
  
- **Permisos anómalos o sospechosos**
  
- **Binarios del sistema alterados** (`ls`, `ps`, `netstat`, etc.)
  
- **Archivos ocultos en lugares inusuales**
  
- Entradas sospechosas en cron o scripts de inicio
  
- Cambios en archivos críticos
  

---

## ✅ Ventajas

- 🔍 **Especializado en rootkits**: excelente para detección temprana.
  
- 🛡️ **No invasivo**: solo lectura, no altera tu sistema.
  
- 📝 **Logs detallados**: te muestra exactamente qué encontró sospechoso.
  
- 🔄 **Fácil de automatizar**: puedes programar escaneos periódicos y alertas por correo.
  
- 🆓 **Libre y open source**.
  

---

## ⚠️ Desventajas

- ⏳ **Escaneos lentos** en discos grandes.
  
- 📦 **Falsos positivos comunes**: marca archivos legítimos como sospechosos si han cambiado.
  
- ❌ **No elimina malware**: solo alerta, no actúa.
  
- 📉 **No detecta malware nuevo sin actualizar**: requiere mantener sus bases actualizadas (aunque no tan frecuentemente como un antivirus).
  
- 🔐 **No reemplaza un IDS o antivirus completo**, sino que lo complementa.
  

---

## 🛠️ Uso básico

Instalación en Debian/Ubuntu:

```bash
sudo apt install rkhunter
```

Actualizar base de datos:

```bash
sudo rkhunter --update
```

Ejecutar un escaneo:

```bash
sudo rkhunter --check
```

Ver resultados:

```bash
less /var/log/rkhunter.log
```

---

## 🔄 Automatización

Puedes agregarlo a `cron` para escaneos diarios y configurar alertas por correo. También puedes usarlo junto a `logwatch` o `fail2ban` como parte de un stack de defensa.

---

## 📌 ¿Deberías usarlo?

Sí, **si quieres una capa adicional de seguridad**, especialmente en:

- Servidores expuestos a internet
  
- Entornos donde no puedes permitir modificaciones no autorizadas (hosting, intranet, DevOps)
  
- Sistemas legacy o donde otros antivirus no están disponibles

**mitigar sus desventajas** es lo que realmente lo vuelve útil y confiable como herramienta de seguridad. Aquí te explico cómo puedes minimizar sus puntos débiles:

---

## ❗ 1. **Falsos positivos**

**Problema:** marca como sospechosos archivos legítimos que han cambiado (ej. tras una actualización del sistema).

**Mitigación:**

- ✅ **Actualiza la base de firmas después de instalar o actualizar software**:
  
  ```bash
  sudo rkhunter --propupd
  ```
  
  Esto le dice a `rkhunter` que los cambios actuales son legítimos.
  
- 🔍 **Lee el log con cuidado**:
  
  ```bash
  less /var/log/rkhunter.log
  ```

  Revisa las advertencias y verifica manualmente si son normales (ej. `netstat` modificado por una actualización).
  

---

## 🐌 2. **Escaneos lentos en sistemas grandes**

**Problema:** en discos con muchos archivos, los escaneos pueden tardar mucho.

**Mitigación:**

- 🔄 **Programa los escaneos fuera del horario de uso** usando `cron`:
  
  ```bash
  sudo crontab -e
  ```

  Ejemplo:
  
  ```cron
  0 3 * * * /usr/bin/rkhunter --check --quiet
  ```

- 🧹 **Excluye rutas no relevantes** en `/etc/rkhunter.conf`:
  
  ```ini
  SKIPFS="/dev /proc /sys /tmp /run"
  ```

---

## 🔐 3. **No detecta malware nuevo si no se actualiza**

**Mitigación:**

- 📥 **Actualiza frecuentemente la base de datos**:
  
  ```bash
  sudo rkhunter --update
  ```

- 🛠️ Automatiza esto con `cron`:
  
  ```cron 
  0 1 * * * /usr/bin/rkhunter --update
  ```


---

## ❌ 4. **No elimina amenazas automáticamente**

**Mitigación:**

- 🧠 Usa `rkhunter` junto a herramientas complementarias:
  
  - `clamav` para escaneo profundo de archivos
    
  - `auditd` para ver qué cambió y cuándo
    
  - `fail2ban` para bloquear IPs que estén intentando vulnerar servicios
    
- 📬 **Habilita alertas por correo electrónico**:
  En `/etc/rkhunter.conf`, configura:
  
  ```ini 
  MAIL-ON-WARNING=tuemail@dominio.com
  ```

---

## ⚙️ 5. **No reemplaza otras defensas**

**Mitigación:**

- 🔗 Combínalo como parte de un stack mínimo de seguridad:
  
  | Herramienta | Función |
  | --- | --- |
  | `rkhunter` | Detección de rootkits y cambios sospechosos |
  | `fail2ban` | Defensa contra ataques externos |
  | `clamav` | Escaneo antivirus puntual o por archivo |
  | `auditd` | Registro detallado de eventos del sistema |
  | `ufw` o `iptables` | Cortafuegos y control de tráfico |
  

---

## Bonus: 🧠 Buenas prácticas generales

- Asegúrate de que **solo usuarios autorizados puedan modificar archivos del sistema**.
  
- Mantén **los binarios críticos bajo vigilancia** con `rkhunter` y `aide`.
  
- Guarda una **copia del sistema limpio** para comparación futura si sospechas de una intrusión.