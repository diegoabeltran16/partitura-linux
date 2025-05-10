## 🐍 `ranger` – *Exploración de archivos en modo terminal, con precisión ninja*

---

### 🧩 ¿Qué es?

**`ranger`** es un **navegador de archivos basado en texto**, que funciona desde la terminal con una interfaz visual de columnas.

Está escrito en Python y utiliza **atajos tipo Vim** para moverse por el sistema de archivos de forma rápida, precisa y sin ratón.

> 🧠 "Si el ratón es la katana de un samurái moderno... ranger es su shuriken invisible."
> 

---

### 🛠️ ¿Para qué sirve?

- Explorar archivos y carpetas desde la terminal de forma visual
- Abrir archivos con programas predeterminados (PDF, imágenes, texto, etc.)
- Mover, copiar, renombrar, eliminar archivos desde el teclado
- Navegar con múltiples paneles
- Previsualizar imágenes o texto en consola (si el sistema lo permite)

---

### 🧪 Instalación

```bash
sudo apt install ranger
```

🔸 También podés instalar complementos como:

```bash
sudo apt install highlight w3m atool mediainfo
```

Estos mejoran la **previsualización de archivos, PDFs, videos y más**.

---

### 🚀 ¿Cómo se usa?

```bash
ranger
```

Y listo, te abre una interfaz tipo panel en terminal.

---

### 🕹️ Navegación básica

| Acción | Tecla |
| --- | --- |
| Moverte entre carpetas | Flechas / `h`, `j`, `k`, `l` |
| Entrar a carpeta / archivo | `Enter` |
| Volver atrás | `h` o `Backspace` |
| Marcar archivo | `Space` |
| Eliminar | `d` |
| Copiar | `yy` (yank) |
| Pegar | `pp` |
| Renombrar | `cw` |
| Ayuda | `?` |

---

### ⚙️ Personalización

Podés configurar tu comportamiento en:

```bash
~/.config/ranger/rc.conf
```

También soporta **previsualizaciones** de imágenes, contenido textual, PDF, etc.

(¡Sí, podés ver imágenes desde consola si configurás bien el visor como `w3m`!)

---

### 🔗 Integraciones y usos

- Ideal para servidores sin entorno gráfico
- Permite abrir archivos con programas gráficos (`xdg-open`)
- Se puede integrar con `tmux` o scripts para automatización
- Trabaja bien con `fzf`, `bat`, `neovim`, etc.

---

### ✅ Pros

| Ventaja | Detalle |
| --- | --- |
| 🎯 Muy rápido | Navegación sin distracciones |
| ⌨️ Completamente con teclado | Ideal para usuarios avanzados |
| 🧩 Configurable | Personalización a fondo |
| 🔍 Previsualización | Ve sin abrir, desde consola |

---

### ❌ Contras

| Contras | Nota |
| --- | --- |
| 🧠 Curva de aprendizaje | Usa teclas tipo Vim |
| 🎨 No tan amigable para novatos | Requiere adaptación |

---

### 🧙‍♂️ Filosofía ninja

> “Ver sin tocar. Explorar sin ser visto.”
> 
> 
> `ranger` es el **ojo del ninja en la oscuridad**: no necesita luz ni interfaz gráfica para conocer el terreno.
>
