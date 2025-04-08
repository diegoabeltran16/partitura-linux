# 🌐 `curl` y `wget` — Tus kunais de conexión directa

## 📌 ¿Qué son `curl` y `wget`?

Ambos son **comandos de terminal para transferir datos** desde o hacia servidores web. Te permiten **descargar archivos, consultar APIs, enviar datos**… todo desde el *dojo* de la terminal.

> 📥 Descargan sin abrir el navegador. Con precisión. En silencio.
> 

---

## 🤺 ¿En qué se diferencian?

| Característica | `curl` | `wget` |
| --- | --- | --- |
| Protocolos | HTTP, HTTPS, FTP, SFTP, SCP, SMB, LDAP, IMAP y más | HTTP, HTTPS, FTP |
| Subidas | ✅  (puede enviar datos, formularios, JSON) | ❌ |
| Descargas | ✅ | ✅ |
| Reintentos | ❌ (requiere flags) | ✅ (automático) |
| Recursividad | ❌ | ✅  (puede descargar sitios completos) |
| Por defecto | Salida en pantalla | Guarda archivo automáticamente |

> ⚔️ curl es el ninja diplomático: habla con APIs, sistemas complejos.
> 
> 
> 🛡️ `wget` es el samurái del archivo: baja lo que le ordenes, sin preguntas.
> 

---

## 🧪 Usos comunes

### 📁 Descargar un archivo

```bash
bash
CopyEdit
# Con curl
curl -O https://example.com/archivo.zip

# Con wget
wget https://example.com/archivo.zip

```

- `O` en `curl` guarda con el mismo nombre del archivo original.
- `wget` lo hace por defecto.

---

### 🌐 Obtener la IP pública

```bash
bash
CopyEdit
curl ifconfig.me

```

> 📡 Ideal cuando querés saber desde qué IP salís al mundo.
> 

---

### 🤖 Consumir una API REST

```bash
bash
CopyEdit
curl https://api.github.com/users/naveen

```

> Verás la respuesta en formato JSON.
> 
> 
> Muy útil para desarrollo, automatización y scrapping de datos legales.
> 

---

### 📤 Enviar datos (POST)

```bash
bash
CopyEdit
curl -X POST -d "usuario=naveen&clave=sombra" https://midominio.com/login

```

> En pruebas de formularios o simulaciones de navegación, curl es esencial.
> 

---

### 🌐 Descargar sitio completo con `wget`

```bash
bash
CopyEdit
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent https://misitioweb.com

```

> ⚠️ Esto es muy avanzado, y debe usarse con responsabilidad y ética.
Puede descargar una copia navegable de un sitio (ideal para estudios offline).
> 

---

## 🛡️ Seguridad y prácticas recomendadas

- Verificá que los sitios usen `https://` (evitás sniffing de tráfico).
- Usá `curl -L` para seguir redirecciones.
- Para descargas grandes, `wget` es más resistente a cortes.
- En conexiones inestables:
    
    ```bash
    bash
    CopyEdit
    wget -c https://archivo.iso  # continúa descarga si se interrumpe
    
    ```
    

---

## 📚 Casos reales de uso ninja

| Misión | Herramienta | Comando |
| --- | --- | --- |
| Ver tu IP pública | `curl` | `curl ifconfig.me` |
| Descargar ISO de Tails | `wget` | `wget https://tails.boum.org/tails.iso` |
| Descargar PDF desde una URL | `curl` | `curl -O https://ejemplo.com/guia.pdf` |
| Enviar datos simulando un login | `curl` | `curl -d "usuario=x" https://sitio.com/login` |
| Descargar múltiples archivos | `wget` | `wget -i lista.txt` (archivo con URLs) |

---

## 🧘‍♂️ Reflexión del Sensei

> “Cuando la red se transforma en niebla,
> 
> 
> el ninja no se pierde…
> 
> usa `curl` para tocar la superficie,
> 
> y `wget` para traer el trozo necesario del mundo.”
> 

---
