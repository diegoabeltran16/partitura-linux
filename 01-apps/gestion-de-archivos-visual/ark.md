# 🧰 **Ark – Gestor de archivos comprimidos en KDE**

## 📌 ¿Qué es Ark?

**Ark** es el gestor gráfico de archivos comprimidos integrado en el entorno **KDE Plasma**.

Permite abrir, explorar, comprimir y extraer archivos `.zip`, `.tar`, `.rar`, `.7z`, y muchos más, **sin salir del entorno gráfico**.

> 💼 Si Plasma es tu dojo visual, Ark es tu técnica para abrir cofres sellados.
> 

---

## ⚙️ ¿Para qué sirve?

| Función | Descripción |
| --- | --- |
| 📂 Abrir archivos comprimidos | ZIP, TAR, RAR, 7Z, ISO, etc. |
| 🧲 Extraer contenido selectivo | Solo extraés lo que necesitás |
| 📦 Crear archivos comprimidos | Elegís formato, nivel de compresión |
| 🔒 Manejo de archivos cifrados | Contraseñas, si el backend lo permite |
| 🧑‍💻 Soporte drag & drop | Arrastrar/soltar directo al escritorio o carpetas |

---

## 🎯 ¿Por qué usar Ark?

- ✅ Ligero y rápido
- ✅ Integrado con **Dolphin**, el explorador de KDE
- ✅ Interfaz limpia y clara
- ✅ Soporta múltiples motores (libarchive, p7zip, unrar…)
- ✅ No requiere línea de comandos para tareas comunes

> “El ninja no necesita fuerza bruta para romper un sello. Usa herramientas precisas.”
> 

---

## 🔧 ¿Cómo funciona?

Cuando hacés doble clic en un `.zip` o `.tar.gz`, **Ark lo abre como una carpeta virtual**.

Podés navegar dentro, abrir archivos individuales, o extraerlos donde elijas.

También permite:

- Crear un nuevo archivo comprimido (menú Archivo → Nuevo)
- Añadir archivos sueltos o carpetas a un `.zip` o `.tar`
- Extraer con clic derecho desde Dolphin: `→ Extraer aquí`, `→ Extraer en...`

---

## 🧠 Comparativa con otras herramientas

| Herramienta | Entorno | Uso principal | CLI o GUI |
| --- | --- | --- | --- |
| `Ark` | KDE | Descompresión visual | GUI |
| `File Roller` | GNOME | Equivalente a Ark | GUI |
| `p7zip` / `tar` / `unzip` | Cualquiera | Avanzado, scripting | CLI |
| `PeaZip` | Multiplataforma | Potente pero pesado | GUI |

---

## 🔍 Integración con el entorno

- Compatible con **KIO** (sistema de archivos virtual de KDE)
- Puedes abrir archivos desde FTP o SSH sin descargarlos
- Interactúa perfectamente con **Dolphin**, el explorador nativo

---

## 🧪 ¿Necesita algo extra?

Para algunos formatos (ej: `.rar`, `.7z`), Ark necesita tener instalados los paquetes:

```bash
bash
CopyEdit
sudo apt install unrar p7zip-full

```

---

## 🧘‍♂️ Reflexión del Sensei

> “Descomprimir no es solo abrir. Es entender lo que está oculto, sin dañar el contenedor.”
> 

En sistemas minimalistas o auditores, no necesitás GUI…

Pero cuando el tiempo apremia o enseñás a nuevos aprendices, **Ark es claridad visual con disciplina técnica.**

---
