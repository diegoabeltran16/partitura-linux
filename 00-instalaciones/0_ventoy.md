## Ventoy: estructura multiboot para entornos portables, éticos y sin rastro

**Ventoy** es una herramienta libre y de código abierto que permite arrancar múltiples sistemas operativos directamente desde una memoria USB, sin necesidad de formatearla cada vez ni "quemar" imágenes ISO.

Este documento describe cómo instalar, configurar y utilizar Ventoy en diferentes sistemas operativos, para construir un entorno multiboot enfocado en la privacidad, la recuperación, el entrenamiento técnico y la autonomía digital.

### 🧠 Metáfora ninja:

> **Ventoy es como el pergamino de invocación.**  
> Lleva varias técnicas (ISOs) en su interior, y cuando elegís una, la invoca temporalmente al campo (RAM), sin dejar rastro en la base (el disco del enemigo 😄).

---

## 🧭 ¿Por qué Ventoy?

Ventoy permite:

- Cargar múltiples ISOs sin reformatear
- Añadir o quitar sistemas simplemente copiando archivos
- Soporte para BIOS, UEFI, Secure Boot
- Verificación sencilla de integridad
- Compatibilidad con más de 100+ sistemas
- Flexibilidad para pruebas, auditorías y rescate

## En resumen:

| Uso | Qué permite |
| --- | --- |
| 🚀 Portabilidad | Entornos completos sin dejar huella |
| 🛠️ Rescate | Reparar, diagnosticar, recuperar sistemas |
| 🕵️ Auditoría | Herramientas de seguridad sin instalación |
| 🧑‍🏫 Enseñanza | Clases, prácticas, demostraciones |
| 🪟 Instalación | SOs múltiples (Linux, Windows, otros) |
| 🌐 PXE Boot | Despliegue en red con iVentoy |

---

---

## 💽 Requisitos

- USB de al menos 32–64 GB (recomendado USB 3.0)
- Acceso a un sistema operativo (Linux, Windows o macOS)
- ISOs verificados de las distros deseadas
- Precaución: el proceso de instalación de Ventoy borra la unidad USB

---

# 🐧 Instalación en Linux (ej: Debian)

```bash
# 1. Crear carpeta de trabajo
mkdir ~/ventoy && cd ~/ventoy

# 2. Descargar Ventoy (ejemplo versión)
wget https://github.com/ventoy/Ventoy/releases/download/v1.1.05/ventoy-1.1.05-linux.tar.gz

# 3. Verificar la integridad (opcional pero recomendado)
echo "hash esperado  ventoy-x.x.xx-linux.tar.gz" > sha256.txt
sha256sum -c sha256.txt

# 4. Extraer el archivo
tar -xzf ventoy-1.1.05-linux.tar.gz && cd ventoy-1.1.05

# 5. Identificar tu USB
lsblk
# Ejemplo: /dev/sdX

# 6. Desmontar particiones montadas
sudo umount /dev/sdX1 /dev/sdX2

# 7. Instalar Ventoy en el dispositivo
sudo ./Ventoy2Disk.sh -i /dev/sdX
⚠️ Asegúrate de elegir el dispositivo correcto. Ventoy borrará todos los datos previos.


```

## 🪟 Instalación en Windows

1. Descargar desde ventoy.net
  
2. Extraer el `.zip`
  
3. Ejecutar `Ventoy2Disk.exe` como administrador
  
4. Seleccionar la unidad USB
  
5. Click en **Install**
  
6. Copiar los archivos `.iso` directamente
  

---

## 🍎 Instalación en macOS

> No tiene GUI nativa, pero sí LiveCD.

1. Descargar `ventoy-x.x.xx-livecd.iso`
  
2. Grabar en USB con **balenaEtcher**
  
3. Bootear ese USB desde el Mac
  
4. En la terminal del LiveCD:
  

bash

CopyEdit

`sudo ./Ventoy2Disk.sh -i /dev/diskX`

> Alternativa para usuarios avanzados: compilar desde Homebrew

---

## 🔒 Recomendaciones de seguridad

- Usar ISOs Live sin persistencia si se requiere anonimato
  
- Verificar ISOs (`sha256sum`, firmas GPG)
  
- No montar discos locales salvo que sea necesario
  
- No guardar contraseñas ni datos sensibles en entornos Live
  
- Extraer el USB siempre de forma segura
  

---

## 💡 Tips adicionales

- Actualizar Ventoy sin borrar ISOs:

bash

CopyEdit

`sudo ./Ventoy2Disk.sh -u /dev/sdX`

- Algunas distros requieren: GRUB2 Mode o Safe Graphics
  
- Puedes crear menús personalizados usando `ventoy.json`
  

---

## 🧠 Conclusión

Ventoy no es solo una herramienta técnica.  
Es una **infraestructura portátil para despliegue ético, temporal y seguro**.

> *Donde no hay raíz… tampoco hay rastro.*

🌐 Enlaces útiles
Página oficial: [https://www.ventoy.net/](https://www.ventoy.net/)

GitHub: [GitHub - ventoy/Ventoy: A new bootable USB solution.](https://github.com/ventoy/Ventoy)

Lista de ISOs compatibles: [test list . Ventoy](https://www.ventoy.net/en/isolist.html)