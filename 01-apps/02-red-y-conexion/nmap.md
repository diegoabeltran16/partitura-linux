# 🕵️ `nmap` — El escáner de redes por excelencia

## 📌 ¿Qué es `nmap`?

**`nmap`** (Network Mapper) es una herramienta de código abierto utilizada para **explorar redes, detectar hosts activos, descubrir servicios y escanear vulnerabilidades**.

Es una de las herramientas más importantes en **ciberseguridad, auditoría ética y administración de redes**.

> 🔍 Fue diseñado inicialmente para detectar puertos abiertos, pero hoy es una suite poderosa de exploración avanzada.
> 

---

## 🧠 ¿Por qué es tan especial?

Porque permite:

- Saber **qué dispositivos** están conectados a una red
- Detectar **puertos abiertos** y servicios activos (HTTP, SSH, etc.)
- Determinar **sistemas operativos, versiones, scripts vulnerables**
- Auditar seguridad sin instalar nada en los equipos remotos

> 🧩 nmap es el Byakugan del entorno digital: ve más allá de lo visible.
> 

---

## 🛠️ Instalación

```bash
bash
CopyEdit
sudo apt install nmap

```

---

## ⚙️ Comandos esenciales

### 🔍 Escanear una IP o dominio

```bash
bash
CopyEdit
nmap 192.168.1.1
nmap ejemplo.com

```

🔸 Muestra puertos abiertos y servicios básicos.

---

### 🚪 Escanear puertos comunes

```bash
bash
CopyEdit
nmap -F 192.168.1.1

```

- `F`: escaneo rápido (los puertos más usados).

---

### 👁️ Escaneo detallado (versión + sistema operativo)

```bash
bash
CopyEdit
nmap -A 192.168.1.1

```

Incluye:

- Detección de versión de servicios
- SO probable del host
- Scripts de detección comunes

> ⚠️ Puede generar alertas en firewalls.
> 

---

### 📡 Escaneo de red completa

```bash
bash
CopyEdit
nmap -sn 192.168.1.0/24

```

🔹 Descubre qué dispositivos están **conectados en tu LAN**.

---

### 🔐 Escanear puertos específicos

```bash
bash
CopyEdit
nmap -p 22,80,443 192.168.1.1

```

---

### 🧪 Usar scripts NSE (Nmap Scripting Engine)

```bash
bash
CopyEdit
nmap --script vuln 192.168.1.1

```

Escanea vulnerabilidades conocidas.

> 🧠 nmap tiene más de 500 scripts NSE para todo tipo de análisis.
> 

---

## 🧩 Casos de uso ninja

| Escenario | Comando | Resultado |
| --- | --- | --- |
| ¿Quién está en la red? | `nmap -sn 192.168.0.0/24` | IPs y hosts activos |
| ¿Qué servicios ofrece un servidor? | `nmap -A ip` | HTTP, SSH, etc. |
| ¿Es seguro ese puerto abierto? | `nmap --script vuln -p 22 ip` | Evalúa riesgos |
| ¿Mi web tiene servicios innecesarios? | `nmap -sV dominio.com` | Detección de versiones |

---

## ⚠️ Consideraciones éticas

- ❗ **No escanear redes sin autorización**.
- Puede activar IDS, firewalls o bloqueos.
- Usalo en **entornos propios o de pruebas**, o con **permiso explícito**.

> “El escaneo sin permiso no es sigilo. Es imprudencia.”
> 

---

## 🎭 Alternativas o complementos

- `zenmap` → versión gráfica de nmap (requiere instalación adicional)
- `masscan` → para escaneos ultra-rápidos en grandes rangos

---

## 🧘‍♂️ Reflexión del Sensei

> “El que ve los puertos... ve las puertas.
> 
> 
> *Y quien ve las puertas, intuye el castillo.”*
> 

> nmap no solo revela servicios. Revela la postura digital de un sistema.
> 
> 
> Aprenderlo es parte del camino de la auditoría ética y el dominio técnico.
> 

---
