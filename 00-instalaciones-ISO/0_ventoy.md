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

## 💽 Requisitos

- USB de al menos 32–64 GB (recomendado USB 3.0)
- Acceso a un sistema operativo (Linux, Windows o macOS)
- ISOs verificados de las distros deseadas
- Precaución: el proceso de instalación de Ventoy borra la unidad USB

---
## 🐧 Instalación de Ventoy en Linux (ejemplo: Debian)

Esta guía explica cómo instalar Ventoy de forma segura en una unidad USB desde un sistema Linux.

El procedimiento **reemplazará todo el contenido de la unidad**, así que asegúrate de usar una USB adecuada y respaldar su contenido si es necesario.


### 📦 Paso 1: Crear carpeta de trabajo

```bash
mkdir ~/ventoy && cd ~/ventoy
```

Esto crea un entorno controlado para guardar la descarga, descomprimir el archivo y ejecutar la instalación.

---

### 🌐 Paso 2: Descargar la última versión de Ventoy

```bash
wget https://github.com/ventoy/Ventoy/releases/download/v1.1.05/ventoy-1.1.05-linux.tar.gz
```

⚠️ *Reemplazá la URL por la versión más reciente desde el repositorio oficial de GitHub:
👉 https://github.com/ventoy/Ventoy/releases*

---

### 🔐 Paso 3: Verificar la integridad de la descarga (opcional pero recomendado)

```bash
sha256sum ventoy-1.1.05-linux.tar.gz
```

Compará el resultado con el hash publicado en la web oficial o en el archivo `sha256.txt` del proyecto.

Esto asegura que el archivo **no fue alterado** durante la descarga (ataques MITM o errores de red).

---

### 📂 Paso 4: Extraer el archivo descargado

```bash
tar -xzf ventoy-1.1.05-linux.tar.gz
cd ventoy-1.1.05
```

Extrae el contenido y accede a la carpeta donde está el script de instalación.

---

### 💽 Paso 5: Identificar correctamente tu unidad USB

```bash
lsblk
```

Buscá en la salida algo como:

```
sda    58.6G
├─sda1 ...
└─sda2 ...

```

**⚠️ Asegurate de identificar el dispositivo correcto (por ejemplo, `/dev/sda` o `/dev/sdb`).**

No te confundas con el disco duro principal del sistema, ya que el siguiente paso **borrará todo** en la unidad seleccionada.

---

### 🧼 Paso 6: Desmontar particiones montadas de la unidad USB

```bash
sudo umount /dev/sdX1 /dev/sdX2
```

Reemplazá `sdX` por la letra correspondiente a tu USB.

Este paso es obligatorio si la unidad fue montada automáticamente.

---

### 🚀 Paso 7: Instalar Ventoy en la unidad

```bash
sudo ./Ventoy2Disk.sh -i /dev/sdX
```

⚠️ **Este paso eliminará todo el contenido previo** en la unidad seleccionada.

Si todo va bien, verás un mensaje de instalación exitosa.

A partir de ahora, la unidad se llamará “Ventoy” y podrá usarse como disco multiboot.

---

### ✅ Resultado esperado

Tu USB ahora tendrá dos particiones:

- Una visible llamada `Ventoy` donde podrás copiar archivos `.iso`
- Otra reservada para el gestor de arranque

---

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
## ⚠️ Problemas comunes al arrancar distros con Ventoy

### 🧅 Tails (y otras distros con requerimientos especiales)

Tails tiene algunas restricciones con **UEFI** y **Secure Boot** que pueden causar errores como:

```
No bootfile found for UEFI
Maybe the image does not support x64 UEFI

```

### 💡 Soluciones posibles:

- Verificá que usás la **imagen `.img` oficial para USB**, no la `.iso` de DVD (Tails diferencia entre ambas).
- Intentá arrancar en **modo Legacy BIOS** si tu equipo lo permite.
- En algunos casos, **Ventoy no es compatible con Tails directamente.**
Se recomienda:
    - Usar **balenaEtcher** o el **Tails Installer**
    - O cargarla desde otro USB externo si necesitás iniciar desde otro sistema

### 🔁 Alternativa:

Usar Tails en un USB aparte, dedicado, fuera de Ventoy, para garantizar su funcionamiento y evitar conflictos con UEFI/Secure Boot.

> Tails es como un ninja solitario. Necesita su propio campo.
No se lleva bien con pergaminos multiboot sin disciplina previa. 😅
>

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

## 🌐 Enlaces útiles

- Página oficial: [https://www.ventoy.net](https://www.ventoy.net/)
- GitHub: [https://github.com/ventoy/Ventoy](https://github.com/ventoy/Ventoy)
- Lista de ISOs compatibles: [https://www.ventoy.net/en/isolist.html](https://www.ventoy.net/en/isolist.html)
