## 🪓 GParted Live: cirugía de discos sin dolor (ni rastro)

**GParted Live** es una distribución GNU/Linux ultraligera basada en Debian, que permite ejecutar la poderosa herramienta de particionado **GParted** desde un entorno completamente en vivo (Live).

Ideal para:

- Crear, redimensionar, mover, borrar o reparar particiones
- Diagnóstico de discos
- Preparación de sistemas para instalaciones múltiples
- Modificación sin necesidad de iniciar otro sistema operativo

> “No se formatea con fuerza… se talla con precisión.”
> 

---

## 🧠 ¿Por qué usar GParted Live?

| Ventaja | Descripción |
| --- | --- |
| 🪶 Ligereza | Corre en RAM, pesa menos de 500 MB |
| 🧰 Herramienta especializada | Interfaz gráfica enfocada solo en particiones |
| 🧼 Sin instalación | 100% Live, no altera discos por sí misma |
| 🧩 Compatible | Reconoce sistemas de archivos Linux, Windows, macOS |
| 💥 Seguro | Incluye utilidades para recuperación o reparación de tabla de particiones |

---

## 📦 ¿Qué incluye GParted Live?

- Entorno gráfico LXDE simple y rápido
- GParted preconfigurado y funcional
- Utilidades como `parted`, `ntfsprogs`, `gsmartcontrol`, `testdisk`, `fdisk`, `lsblk`, `fsck`, etc.
- Capacidad para guardar logs de sesión o usar modo experto
- Opción de ejecutar desde RAM (modo copy to RAM)

---

## 💽 Requisitos

- USB de 512 MB a 1 GB mínimo
- ISO oficial desde: https://gparted.org/download.php
- Puede ejecutarse sin problema desde **Ventoy**
- Compatible con BIOS y UEFI
- *No necesita persistencia*

---

## 🔧 Uso típico

1. Descargar ISO → verificar SHA256
2. Copiar a USB (Ventoy o con balenaEtcher)
3. Bootear desde el USB
4. Esperar que cargue el entorno gráfico
5. Seleccionar idioma y teclado
6. Iniciar GParted desde el acceso directo

---

## 🧩 Interfaz de GParted

```
text
CopyEdit
----------------------------------------------------------
| /dev/sda [58.59 GiB]                                   |
|--------------------------------------------------------|
| [ext4] [boot]   | [swap]     | [ntfs]     | Unallocated|
----------------------------------------------------------

```

- Podés hacer clic derecho sobre cada partición
- Crear, redimensionar, borrar, formatear, verificar
- Aplicar todos los cambios juntos (¡hasta que confirmás, nada se ejecuta!)

---

## 🧘 Recomendaciones de uso ético

- **Leer antes de tocar**: asegurate de entender el esquema antes de modificarlo
- Hacer *backups* si vas a redimensionar particiones con datos
- Ideal para limpiar discos antes de donarlos o reciclarlos
- Se puede usar para borrar metadatos (firma, bootloader, etc.)
- Muy útil para limpiar discos sin dejar rastro previo

---

## 🧠 Comandos útiles en terminal (opcional)

```bash
bash
CopyEdit
lsblk                    # Ver estructura del disco
fdisk -l                 # Listar todas las particiones
parted /dev/sda print    # Ver info detallada
wipefs -a /dev/sdaX      # Borrar firmas de sistema de archivos

```

---

## 🧩 Casos de uso sugeridos

| Objetivo | Acción |
| --- | --- |
| Preparar disco para instalación nueva | Borrar todas las particiones y crear nuevo esquema |
| Reparar disco que no inicia | Verificar sectores, borrar flags, recrear tabla GPT |
| Fusionar particiones | Redimensionar, mover, aplicar cambios secuenciales |
| Quitar rastros previos | Eliminar particiones y borrar metadatos (`wipefs`) |

---

## 🧠 Conclusión

GParted Live es una herramienta quirúrgica.

No ocupa espacio, no deja rastros innecesarios y te permite **control total sobre el diseño de tu almacenamiento**.

> “Un sistema comienza en la raíz… pero su equilibrio se decide en las particiones.”
> 

---

## 🌐 Recursos útiles

- Sitio oficial: [https://gparted.org](https://gparted.org/)
- Lista de cambios y versiones: https://gparted.org/news.php
- Manual de uso: https://gparted.org/display-doc.php?name=gparted-help-manual

---
