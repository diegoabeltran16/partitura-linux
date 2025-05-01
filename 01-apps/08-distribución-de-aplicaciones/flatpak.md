## 🔍 ¿Qué es Flatpak exactamente?

**Flatpak** es un sistema de distribución de aplicaciones para Linux que permite:

- Ejecutar aplicaciones en **sandbox** (aisladas del sistema).
  
- Instalar apps con **todas sus dependencias**, sin interferir con tu sistema.
  
- Usar versiones recientes, incluso si tu distro es estable (como Debian).
  
- Evitar conflictos de librerías entre apps.
  

Cada app Flatpak corre en su entorno independiente, pero puede integrarse con el sistema (tema visual, archivos, micrófono, etc.) mediante permisos configurables.

---

### 📂 ¿Dónde se almacenan las apps Flatpak?

- Apps: `~/.var/app/`
  
- Archivos Flatpak: `/var/lib/flatpak/` o `~/.local/share/flatpak/`
  
- Configuración de usuario: `~/.config/flatpak/`
