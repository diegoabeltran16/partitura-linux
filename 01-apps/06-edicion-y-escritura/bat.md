# 🦇 **bat – El gato que se convirtió en murciélago ninja**

> “Donde cat solo te muestra... bat te ilumina.”
> 

---

## 🧠 ¿Qué es `bat`?

**`bat`** es una herramienta de línea de comandos que reemplaza al clásico `cat`, pero con esteroides visuales.

Es decir:

📜 Mientras `cat` solo imprime texto plano, `bat` muestra:

- ✅ Coloreado de sintaxis (para código)
- ✅ Numeración de líneas
- ✅ Integración con `git` para mostrar cambios
- ✅ Panel de scroll si el contenido es largo
- ✅ Temas oscuros y elegantes para tu consola

> Ideal para leer scripts, config files, Markdown, JSON, YAML, logs, o cualquier cosa que merezca ser vista con claridad y elegancia.
> 

---

## 🧩 ¿Por qué deberías usarlo?

| Característica | Comparado con `cat` |
| --- | --- |
| 🌈 Sintaxis coloreada | ✅ Resalta estructuras (código, configs) |
| 🔢 Líneas numeradas | ✅ Ideal para depurar |
| 🔍 Scroll interactivo | ✅ Compatible con paginadores como `less` |
| 🧠 Contexto visual | ✅ Muestra encabezados y separaciones claras |
| 🎯 Integración `git` | ✅ Muestra líneas modificadas (`+`, `-`, etc.) |

> bat es al cat lo que un katana forjada a mano es a un cuchillo de cocina oxidado.
> 

---

## 🛠️ ¿Cómo instalar `bat` en KDE Neon?

```bash
bash
CopyEdit
sudo apt update
sudo apt install bat

```

🧠 ⚠️ **En Debian y Ubuntu**, el binario se instala como `batcat`, así que para ejecutarlo:

```bash
bash
CopyEdit
batcat archivo.txt

```

📌 Recomendación: creá un alias para no escribir `batcat` todo el tiempo:

```bash
bash
CopyEdit
echo "alias bat='batcat'" >> ~/.bashrc
source ~/.bashrc

```

---

## ⚙️ ¿Cómo funciona?

```bash
bash
CopyEdit
bat archivo.txt

```

Te muestra el archivo con colores, líneas numeradas y scroll automático (si es largo).

### Ejemplos:

```bash
bash
CopyEdit
bat ~/.bashrc
bat 00-instalaciones/kde-neon.md
bat scripts/limpiar-temporal.sh

```

También podés combinarlo con pipes:

```bash
bash
CopyEdit
cat archivo.txt | bat

```

O comparar con `diff`:

```bash
bash
CopyEdit
bat archivo_viejo archivo_nuevo

```

---

## 🎯 Integraciones ninja

| Herramienta | Uso combinado |
| --- | --- |
| `fzf` + `bat` | Vista previa rápida en selección de archivos |
| `git` + `bat` | Ver cambios en archivos modificados |
| `less` | `bat` actúa como paginador |
| `grep` | Resultados de búsqueda con contexto y color |

---

## 🧘‍♂️ Reflexión del Sensei

> “No se trata solo de leer… sino de leer con intención.”
> 

> Cuando un ninja mira un archivo de configuración, necesita saber:
> 
> - qué cambió,
> - qué está activo,
> - qué podría romperse.
> 
> `bat` es esa linterna.
> 
> Y cada línea resaltada, un hilo visible del sistema.
> 

---

## 🧩 Alternativas similares

- `cat` – básico, rápido, pero ciego
- `less` – útil, pero sin resaltado por defecto
- `ccat`, `pygmentize` – más antiguos, menos integrados
- `highlight` – otra opción para colorear desde terminal

---
