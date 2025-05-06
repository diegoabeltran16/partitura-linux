tabla comparativa clara entre **rclone** y **onedrive (abraunegg)**, considerando que ambos pueden ser utilizados para sincronizar y montar OneDrive en sistemas Linux como Debian XFCE:

| Característica | **rclone** | **onedrive (abraunegg)** |
| --- | --- | --- |
| **Lenguaje** | Go  | D   |
| **Compatibilidad con nubes** | Multicloud (OneDrive, Google Drive, Dropbox, etc.) | Exclusivo para OneDrive |
| **Instalación** | Fácil (paquetes, script oficial, Snap, etc.) | Requiere compilación (aunque hay paquetes para Debian) |
| **Soporte oficial OneDrive** | API oficial (limitado en algunos modos) | API oficial con excelente integración |
| **Modos de sincronización** | Varios: sync, copy, move, mount | Monitorización en tiempo real y sincronización local |
| **Montaje como unidad (mount)** | Sí (usando `rclone mount`, requiere `fusermount`) | No directamente (enfocado en sincronización, no montaje) |
| **Bidireccionalidad** | Soporta bidireccional, pero no es el enfoque principal | Sí, puede detectar cambios en tiempo real |
| **Velocidad** | Rápida en lectura/escritura | Alta eficiencia, optimizada para OneDrive |
| **Consumo de recursos** | Moderado | Muy bajo (daemon ligero, especialmente con `--monitor`) |
| **Configuración** | CLI interactiva, puede ser compleja | Archivos de configuración sencillos (`onedrive.conf`) |
| **Cifrado** | Soportado (a través de backend `crypt`) | No integrado, requiere capas externas |
| **Desarrollo activo** | Muy activo y con comunidad grande | Muy activo por parte de *abraunegg*, enfocado |
| **Documentación** | Extensa, para múltiples nubes | Precisa y muy enfocada en OneDrive |
| **Soporte para OneDrive Personal** | Sí  | Sí  |
| **Soporte para OneDrive Business** | Sí  | Sí (Office 365/SharePoint incluido) |
| **Monitor de cambios** | No nativo (se puede usar con `--poll-interval`) | Sí, con `--monitor` para sincronización automática |

---

###

