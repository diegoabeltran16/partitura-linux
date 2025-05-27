## 🔥 ¿Qué es `ufw`?

`ufw` es una **interfaz simplificada para manejar iptables** (el firewall de bajo nivel de Linux). Fue diseñada para que los usuarios pudieran configurar reglas de red **de forma rápida y segura**, sin necesidad de escribir líneas complejas de `iptables`.

---

## ✅ Ventajas de `ufw`

| Ventaja | Explicación |
| --- | --- |
| 🧠 **Fácil de usar** | Sintaxis clara y legible para añadir, eliminar y ver reglas |
| 📦 **Viene preinstalado en Ubuntu** | Ya listo para activar en muchos sistemas |
| 🧱 **Buen punto de partida para hardening** | Controla qué servicios pueden ser accedidos y desde qué IP |
| 🔁 **Soporta perfiles por aplicación** | Puedes permitir servicios como `Apache`, `OpenSSH` por nombre |
| 📝 **Reglas persistentes** | Las reglas se mantienen tras reiniciar |
| 🔐 **Soporta IPv6, interfaces, y rangos IP** | Puedes restringir por red, protocolo o interfaz específica |

---

## ⚠️ Desventajas de `ufw`

| Desventaja | Riesgo / Limitación |
| --- | --- |
| ⚙️ **Menos flexible que `iptables` puro** | No permite reglas complejas (ej. NAT, port-knocking, módulos avanzados) |
| 🔍 **No tiene GUI nativa** | Aunque hay frontends como GUFW, la mayoría del manejo es por CLI |
| 🔄 **Puede desactivarse por error** | Si se desactiva sin reglas adecuadas, el sistema queda expuesto |
| ❌ **Sin registros de conexión activos por defecto** | No loguea intentos bloqueados hasta que se activa `logging` manualmente |
| 🤖 **No detecta amenazas, solo bloquea o permite tráfico** | No es un IDS, no analiza comportamiento de red como `snort` o `suricata` |

---

## 🛡️ Cómo mitigar las desventajas

### 1. ⚙️ Menor flexibilidad comparado con `iptables`

**Mitigación:**

- Para configuraciones avanzadas, puedes usar `iptables` directamente, o mejor aún: complementar con `nftables`.
  
- También puedes combinar `ufw` con herramientas como `fail2ban` para defensa activa.
  

---

### 2. 🔍 No tiene GUI nativa

**Mitigación:**

- Instala `GUFW`, una interfaz gráfica para `ufw` (ideal para escritorios):
  
  ```bash
  sudo apt install gufw
  ```

---

### 3. 🔄 Puede desactivarse por error

**Mitigación:**

- Antes de desactivar, asegúrate de tener acceso físico o SSH persistente.
  
- Usa `ufw status numbered` para revisar y respaldar las reglas antes de hacer cambios.
  
- Siempre **habilita solo después de configurar reglas mínimas**, por ejemplo:
  
  ```bash
  sudo ufw allow ssh sudo ufw enable
  ```

---

### 4. ❌ No registra conexiones por defecto

**Mitigación:**

- Activa el registro de eventos:
  
  ```bash
  sudo ufw logging on
  ```

- Luego puedes consultar en:
  
  ```bash 
  tail -f /var/log/ufw.log
  ```

---

### 5. 🤖 No detecta ataques, solo bloquea

**Mitigación:**

- Complementa `ufw` con:
  
  - `fail2ban` para bloquear IPs que ataquen servicios
    
  - `rkhunter` para detectar alteraciones internas
    
  - `snort` o `suricata` si necesitas un IDS/IPS más avanzado
    

---

SCRIPT [[diegoabeltran16/partitura-linux/02-scripts/01-privacidad-y-seguridad-SCRIPTS/03-UFC-scipts/ufw-manager.sh]]

 1) Inicializar firewall (reset + políticas por defecto)
 2) Permitir SSH
 3) Permitir HTTP/HTTPS
 4) Permitir puerto personalizado
 5) Denegar puerto personalizado
 6) Permitir IP específica
 7) Mostrar estado de ufw
 8) Desactivar firewall
 9) Reiniciar configuración (ufw reset)

 ---

 ## 🧩 ¿Qué hace exactamente la opción 1?

[Cuando seleccionas `1) Inicializar firewall`, el script ejecuta:](diegoabeltran16/partitura-linux/02-scripts/01-privacidad-y-seguridad-SCRIPTS/03-UFW-scipts/ufw-manager.sh)

```bash
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Esto realiza **tres acciones clave**:

### 1️⃣ `ufw --force reset`

🔄 **Limpia completamente** todas las reglas actuales del firewall.

- Borra cada puerto permitido o denegado previamente.
  
- Elimina cualquier configuración personalizada.
  
- Resetea a cero el estado del firewall, **como si lo instalaras de nuevo**.
  

✅ Útil si has tocado mucho sin entender y sientes que “rompiste algo”.

---

### 2️⃣ `ufw default deny incoming`

🚫 **Bloquea todo el tráfico entrante por defecto**.

- Cierra todos los puertos abiertos **a menos que tú explícitamente los permitas**.
  
- Si alguien desde Internet intenta acceder a tu máquina: *no pasa*.
  

> Ejemplo: si tú no agregas una regla para permitir SSH, nadie podrá hacer `ssh tuusuario@tuIP`.

**Por qué es importante:**  
Esto crea una **muralla de contención**: tu máquina *no responde a conexiones externas* salvo que tú lo decidas.  
Evita escaneos automatizados, bots, ataques por puertos abiertos como el 22 (SSH), 139 (Samba), etc.

---

### 3️⃣ `ufw default allow outgoing`

✅ **Permite todo el tráfico saliente por defecto**.

- Puedes seguir usando el navegador, actualizaciones de sistema, curl, etc.
  
- Tu máquina puede hablar con el mundo… pero el mundo no puede hablar contigo.
  

> Esto respeta tu flujo normal de trabajo: navegar, clonar desde GitHub, actualizar, enviar datos a Rclone…

---

## 🎯 ¿Cuándo y por qué usar esta opción?

| Situación | ¿Por qué elegir esta opción? |
| --- | --- |
| **Primera vez que usas ufw** | Es el **punto de partida ideal**: eliminas incertidumbre, partes desde lo básico y seguro. |
| **Sospechas que algo está mal configurado** | Borra todas las reglas anteriores que podrías haber añadido mal. |
| **Preparas tu máquina para exponer servicios** | Antes de permitir puertos (como 22 o 443), es bueno partir desde un firewall “cerrado por defecto”. |
| **Pruebas automatizadas de seguridad o scripts** | Te da un entorno limpio y predecible para aplicar nuevas reglas sin arrastre de errores pasados. |
| **Reinicias políticas tras instalar un servicio nuevo** | Por ejemplo, instalas un servidor Nginx y quieres que solo ese puerto quede abierto. |

---

## 🧠 ¿Qué debes saber antes de usar esta opción?

- Si estás **trabajando de forma remota por SSH**, ejecutar esto sin habilitar SSH inmediatamente después puede desconectarte y dejarte fuera (⚠️ cuidado).
  
- No reinicia el estado del sistema (no reinicia el equipo), solo limpia las reglas de UFW.
  
- No afecta el firewall de red de tu router, solo el de tu máquina local.
  

---

## 🛡️ Analogía:

> Es como cerrar **todas las ventanas de tu casa**, y luego ir una por una abriendo solo las que necesitas, en lugar de dejar todas abiertas y esperar que nadie entre.

---

