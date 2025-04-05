## 🕊️ 3_tails-live.md

**Tails: sistema operativo amnésico, ético y sin rastro**

---

### 🧭 Introducción

Tails (The Amnesic Incognito Live System) es una distribución basada en Debian, diseñada para la **privacidad total, el anonimato en red y el uso seguro de sistemas temporales**.

Corre completamente desde una USB (o DVD) y **no deja huellas** en el equipo anfitrión, a menos que el usuario lo indique.

Todas las conexiones pasan por Tor, y su diseño prioriza la protección contra vigilancia y censura.

> 🥷 Tails no recuerda. No escribe. No deja rastro.
> 
> 
> Ideal para sesiones seguras, navegación cifrada o comunicación ética bajo entornos controlados.
> 

---

### ⚠️ Consideraciones iniciales

- **Tails no es compatible con Ventoy.**
    
    Debe ser instalado de forma directa en la USB, usando herramientas como Tails Installer o `dd`.
    
- **Tails corre en modo live por defecto**
    
    (sin persistencia a menos que lo configures).
    
- **Necesitarás dos dispositivos USB** para la instalación desde otro sistema, o una máquina virtual para crear el medio.

---

### 💽 Requisitos técnicos

| Requisito | Valor mínimo recomendado |
| --- | --- |
| Dispositivo USB | 8 GB o más |
| RAM del equipo | 2 GB (mínimo) – 4 GB (óptimo) |
| Arquitectura | x86_64 (64-bit Intel/AMD) |
| Fuente confiable para ISO | [https://tails.net](https://tails.net/) |

---

### 🔐 Ética y contexto de uso

Tails está pensado para personas que:

- Necesitan **privacidad extrema**: activistas, periodistas, investigadores
- Quieren evitar rastreos o vigilancia masiva
- Desean comunicarse en canales cifrados (Tor, Signal, OnionShare)
- Trabajan desde espacios públicos o prestados

> 🧠 La privacidad no es un lujo, es una forma de resistencia informada.
> 

---

### 📦 Aplicaciones preinstaladas

| App | Propósito |
| --- | --- |
| 🧅 **Tor Browser** | Navegación cifrada y anónima |
| 📬 **Thunderbird (con Enigmail)** | Correo seguro + GPG |
| 🔐 **Kleopatra / Password and Keys** | Gestión de claves |
| 🔁 **Nautilus + Filesystem sandbox** | Explorador con aislamiento |
| 🔒 **VeraCrypt** | Cifrado de volumenes |
| 📝 **Gedit** | Edición ligera |
| 🖼️ **MAT (Metadata Anonymization Toolkit)** | Elimina metadatos ocultos |
| 📤 **OnionShare** | Compartir archivos por Tor |
| 🛰️ **Unsafe Browser (opcional)** | Para logueo cauteloso a portales Wi-Fi |

---

### ⚙️ Instalación paso a paso

### 🧪 A. Desde otro Linux (con `dd`)

1. Verificar el nombre del dispositivo USB vacío

```bash
bash
CopyEdit
lsblk

```

1. Instalar la imagen (cuidado, destruye contenido)

```bash
bash
CopyEdit
sudo dd if=tails-amd64-x.x.iso of=/dev/sdX bs=4M status=progress oflag=sync

```

> Asegúrate de reemplazar sdX con el nombre real de tu USB.
> 

---

### 🖥️ B. Desde Windows

1. Descargar ISO desde: [https://tails.net](https://tails.net/)
2. Descargar e instalar [balenaEtcher](https://etcher.io/)
3. Seleccionar ISO → USB → Flash
4. Bootear desde la USB recién creada

---

### 🛡️ Personalización mínima

Aunque Tails no guarda cambios por defecto, **puede configurarse una “almacenamiento persistente cifrado”** (opcional), para guardar:

- Claves GPG o SSH
- Documentos seleccionados
- Conexiones Wi-Fi confiables
- Bookmarks o configuración de Tor

Esta persistencia es **opcional, cifrada y protegida por passphrase.**

---

### 🎯 Uso típico

| Escenario | Cómo lo soluciona |
| --- | --- |
| Café internet público | Cifra y no deja rastro local |
| Compartir info sensible | OnionShare o correos con GPG |
| Revisar cuentas personales | Solo si es seguro y necesario (ideal no hacerlo) |
| Documentación crítica | Sesiones en RAM, con copia manual temporal |
| Comunicación anónima | Tor + cifrado extremo |

---

### 🧘‍♂️ Filosofía de Tails

> “La mejor huella… es la que nunca fue creada.”
> 
> 
> Tails no te da velocidad ni belleza gráfica.
> 
> Te da **paz mental y distancia táctica** en un mundo donde todo quiere ser rastreado.
> 

---

### 🌐 Enlaces útiles

- Página oficial: [https://tails.net](https://tails.net/)
- Manual de usuario: https://tails.boum.org/doc/index.en.html
- Verificación GPG: https://tails.boum.org/install/download/

---
