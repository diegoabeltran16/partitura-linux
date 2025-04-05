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
🪓 Funciones clave de la cirugía de disco (con ejemplos)
1. 🧱 Crear particiones nuevas
Función: Dividir el disco en bloques independientes para distintos sistemas operativos, propósitos o seguridad.

Ejemplo:
Un disco de 1 TB se puede dividir así:

500 GB para KDE Neon (/)

100 GB para Kali Live persistente (/mnt/kali)

100 GB cifrados (/mnt/secreto)

200 GB para backups (ext4 o NTFS)

100 GB sin asignar (espacio en espera, como técnica de reserva)

“El ninja no deja todas sus armas en el mismo lugar.”

2. 📦 Redimensionar particiones
Función: Cambiar el tamaño de una partición sin perder los datos. Útil si te estás quedando sin espacio o querés reorganizar.

Ejemplo:
Tenías KDE Neon en 300 GB, pero necesitás solo 100 GB. Redimensionás esa partición y liberás 200 GB para otra distro.

“Una hoja afilada no necesita ser grande. Solo precisa cortar con intención.”

3. 🔁 Mover particiones
Función: Cambiar de lugar una partición dentro del disco.
Es común al reorganizar o preparar para un sistema con requisitos específicos.

Ejemplo:
Querés que una partición esté al comienzo del disco por motivos de rendimiento (como /boot o partición EFI). La movés sin borrar contenido.

4. 🚿 Borrar particiones
Función: Eliminar completamente una partición y su estructura.

Ejemplo:
Estás por donar o reciclar un disco. Borrás todas las particiones y luego pasás wipefs para eliminar metadatos de sistema.

“Lo que se borra bien… no deja historia.”

5. 🩹 Reparar sistemas de archivos
Función: Si una partición no se monta, está dañada o tiene errores, se puede revisar con herramientas como fsck.

Ejemplo:
Tu partición de datos ext4 muestra errores. Desde GParted podés correr una verificación y reparar sectores inconsistentes.

6. 🧭 Cambiar etiquetas, UUIDs o flags
Función: Nombrar particiones (para orden), o ajustar flags como boot, esp, lba que definen si son arrancables, visibles, etc.

Ejemplo:
Querés que la partición de KDE Neon sea la arrancable por defecto: le ponés el flag boot. O renombrás una partición de backups como “ArchivoNaveen”.

7. 🔐 Preparar cifrado
Función: Borrar, formatear o dejar espacio sin montar para usar con LUKS, Veracrypt, o sistemas de contenedores cifrados.

Ejemplo:
Reservás 50 GB no formateados. Más tarde, creás un contenedor cifrado allí para tus claves, grimorios o investigaciones delicadas.

“El mejor escondite es aquel que no aparenta serlo.”

8. 🪞 Clonar o copiar particiones
(No directamente en GParted, pero sí con herramientas externas del entorno Live.)

Función: Hacer una copia bit a bit de una partición (o todo el disco).

Ejemplo:
Antes de una operación de riesgo, clonás tu sistema estable en otra partición como backup.

🧠 ¿Por qué usar cirugía de disco?
Para planificar tu entorno multiboot

Para optimizar el rendimiento

Para crear espacios éticos y portables

Para mantener el control sobre tus datos

Para evitar dejar rastro innecesario en espacios digitales

---

## 🌐 Recursos útiles

- Sitio oficial: [https://gparted.org](https://gparted.org/)
- Lista de cambios y versiones: https://gparted.org/news.php
- Manual de uso: https://gparted.org/display-doc.php?name=gparted-help-manual

---
