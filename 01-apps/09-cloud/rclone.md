**rclone** es una herramienta de línea de comandos muy poderosa y versátil para gestionar archivos en la nube. Es especialmente popular entre usuarios avanzados y administradores de sistemas por su capacidad de sincronizar, copiar, montar y encriptar archivos en múltiples servicios de almacenamiento en la nube y locales.

---

### 🧰 ¿Qué es rclone?

**rclone** es una utilidad de código abierto escrita en Go, que funciona como un “rsync” pero para servicios de almacenamiento en la nube. Soporta más de 70 servicios, incluyendo:

- Google Drive
  
- OneDrive
  
- Dropbox
  
- Amazon S3
  
- Backblaze B2
  
- Mega
  
- FTP, SFTP
  
- WebDAV
  
- Local filesystem
  
- y muchos más...
  

---

### 🧪 ¿Qué puedes hacer con rclone?

- **Sincronizar** carpetas entre tu equipo y un servicio en la nube (`sync`)
  
- **Copiar** archivos hacia o desde la nube (`copy`)
  
- **Montar** tu nube como si fuera una carpeta local (`mount`)
  
- **Listar** archivos remotos (`ls`, `lsf`, `lsjson`)
  
- **Encriptar y desencriptar** archivos sobre la marcha (`crypt`)
  
- **Verificar integridad** de los datos (`check`)
  
- **Servir archivos** vía HTTP/WebDAV/SFTP directamente desde la nube (`serve`)
  
- **Automatizar backups** y flujos de trabajo con scripts
  

---

### 🧱 Ejemplo básico de uso

bash

CopyEdit

`rclone config`

Este comando lanza el asistente de configuración interactiva, donde defines una “remote” (una conexión a la nube).

Una vez configurado:

bash

CopyEdit

`rclone copy /home/usuario/mis_archivos remote:backup/`

Esto copiará tus archivos locales a la carpeta `backup/` en tu nube configurada.

---

### 🛡️ ¿Y la seguridad?

rclone maneja autenticación segura (OAuth2 cuando aplica) y puede cifrar archivos (nombres, contenidos y metadata) usando su backend `crypt`. Esto es muy útil para subir archivos sensibles a servicios como Google Drive sin revelar su contenido real.

---

### 💡 Casos comunes de uso

- Respaldos automáticos diarios hacia la nube
  
- Acceso remoto a archivos como si fueran locales
  
- Compartir archivos cifrados por la nube
  
- Migración entre servicios de nube (por ejemplo de Dropbox a OneDrive)