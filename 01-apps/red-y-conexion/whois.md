# 🌐 `whois` — Investigación de dominios y huellas digitales

## 📌 ¿Qué es `whois`?

**`whois`** es una herramienta que consulta **bases de datos públicas de registro de dominios y direcciones IP**.

Permite saber **quién registró un dominio, cuándo, con qué datos y ante qué entidad.**

> Es una técnica básica de OSINT (Open Source Intelligence), usada por analistas, periodistas, hackers éticos… y ninjas digitales 🥷.
> 

---

## 🧠 ¿Para qué sirve?

- 📅 Ver **fecha de creación** y vencimiento de un dominio
- 📬 Ver **email del registrante** (si no está oculto)
- 🏢 Ver el **proveedor del dominio** (ej: GoDaddy, Namecheap)
- 🌎 Ver **servidores DNS** asociados
- 🔍 Saber si un dominio está activo o libre

> 🧩 Ideal para detectar relaciones entre sitios, rastrear campañas, o validar información.
> 

---

## 🛠️ Instalación

```bash
bash
CopyEdit
sudo apt install whois

```

---

## ⚙️ Comandos esenciales

### 🔍 Consultar un dominio

```bash
bash
CopyEdit
whois dominio.com

```

🔸 Devuelve todo el registro: fechas, registrador, contactos, DNS...

---

### 📡 Consultar una IP

```bash
bash
CopyEdit
whois 8.8.8.8

```

🔹 Muestra el rango de IP, la organización y el país.

> 🧠 Útil para saber a qué empresa pertenece una IP pública.
> 

---

## 📦 Ejemplo práctico

```bash
bash
CopyEdit
whois openai.com

```

Resultado parcial:

```
yaml
CopyEdit
Registrar: MarkMonitor Inc.
Creation Date: 2015-04-16
Updated Date: 2023-03-27
Registrar WHOIS Server: whois.markmonitor.com
Name Servers:
    ns1.p28.dynect.net
    ns2.p28.dynect.net
...

```

> 🔍 Si el dominio tiene privacidad activada, verás algo como “Registrant: Privacy Service”.
> 

---

## 🧩 Usos ninja del `whois`

| Objetivo | Comando | Resultado |
| --- | --- | --- |
| Saber si un dominio ya está registrado | `whois ejemplo.com` | Datos o “No match” |
| Ver IP de DNS sospechoso | `whois 185.199.110.153` | Cloudflare, Google, etc. |
| Investigar dominios en campañas de phishing | `whois` sobre URLs cortas o sospechosas | ¿Quién está detrás? |
| Comprobar la “antigüedad” de un sitio | `whois dominio.com` | Fecha de creación |

---

## ⚠️ Consideraciones

- Muchos dominios usan servicios de **privacidad WHOIS**.
- Algunos registradores (como `Namecheap`) ocultan datos por defecto.
- También existen variantes regionales (WHOIS .com vs WHOIS .co.uk, etc.)

---

## 🧘‍♂️ Reflexión del Sensei

> “Toda fortaleza tiene su acta de nacimiento.”
> 
> 
> `whois` es el arte de leer el **pasado administrativo de una presencia digital**.
> 
> Lo que no se ve en la interfaz… se revela en el registro.
>
