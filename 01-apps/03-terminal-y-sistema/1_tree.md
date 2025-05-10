## 🌳 `tree` – *Visualizador jerárquico de directorios*

---

### 🧩 ¿Qué es?

`tree` es una herramienta de línea de comandos que **muestra la estructura de directorios y archivos en forma de árbol**.

En vez de solo listar carpetas con `ls`, **te da una visión completa y jerárquica** de cómo está organizado tu sistema o proyecto.

> 🧠 “Con tree, el bosque ya no te oculta los caminos.”
> 

---

### 🛠️ ¿Para qué sirve?

- Visualizar cómo están organizados tus archivos
- Entender estructuras de proyectos grandes
- Ver cuántos niveles profundos tiene un directorio
- Diagnosticar duplicaciones, carpetas vacías o desorden

---

### 🚀 ¿Cómo se instala?

```bash
sudo apt install tree
```

> ⚠️ No viene preinstalado por defecto en muchas distros.
> 

---

### 📂 Uso básico

```bash
tree
```

🔸 Esto muestra el árbol desde el directorio actual.

---

### ⚙️ Opciones útiles

| Comando | Acción |
| --- | --- |
| `tree -L 2` | Limita la profundidad a 2 niveles |
| `tree -a` | Incluye archivos ocultos |
| `tree -d` | Solo muestra directorios |
| `tree -h` | Muestra tamaños de archivo legibles |
| `tree /ruta` | Muestra estructura de otra carpeta |

---

### 🧩 Ejemplo:

```bash
tree -L 2 -a ~/Documentos
```

Muestra la jerarquía hasta dos niveles, incluyendo archivos ocultos, dentro de `Documentos`.

---

### ✅ Pros

| Ventaja | Por qué |
| --- | --- |
| 🧠 Claridad visual | Ves de un vistazo la estructura completa |
| 🔍 Ideal para revisión | Auditar backups, proyectos, repos |
| 🐚 Muy ligero | Perfecto para terminales remotas |

---

### ❌ Contras

| Desventaja | Detalle |
| --- | --- |
| 📦 No interactivo | No podés navegar, solo observar |
| 📈 En carpetas enormes puede ser ruidoso | Limitar con `-L` para claridad |

---

### 🧙‍♂️ Metáfora ninja

> “Con tree, no caminas a ciegas. Leés el bosque como quien lee el destino.”
> 

---
