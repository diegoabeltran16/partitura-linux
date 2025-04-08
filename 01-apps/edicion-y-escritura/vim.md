# 🧠 **Vim – El editor que no edita: medita**

## 📌 ¿Qué es Vim?

**Vim** (Vi IMproved) es un editor de texto **modal**, ultrarrápido y basado en teclado.

Fue creado como una mejora del editor original **vi** de UNIX (años 70s), y es hoy uno de los pilares del trabajo en terminal para desarrolladores, administradores de sistemas y hackers éticos.

> 🧩 No se trata de escribir texto, sino de manipularlo con precisión quirúrgica.
> 

---

## ⚔️ ¿Para qué sirve?

| Uso | Descripción |
| --- | --- |
| 📄 Edición de archivos de texto plano | `.txt`, `.md`, `.conf`, scripts, etc. |
| 🧪 Desarrollo de software | Desde bash hasta Python, C, Rust, etc. |
| 🔐 Configuración de sistemas Linux | Editar `/etc/hosts`, `.bashrc`, `fstab`... |
| 📦 Automatización & scripting | Crear y editar scripts con control total |
| 🧠 Memorización y control mental | Desarrollo de pensamiento modal y focus absoluto |

---

## 🔥 ¿Por qué aprender Vim?

- 🧠 **No usa mouse**: todo se hace con teclado
- 🧨 **Velocidad extrema** al manipular texto
- 💻 Corre en cualquier sistema UNIX-like (Linux, BSD, macOS…)
- 💾 Consumo casi nulo
- 🧩 Altamente extensible (con plugins, colores, modos)
- 🧙‍♂️ No solo editás: aprendés a **pensar en comandos**

> "Vim no te pide que lo uses. Te exige que lo domines."
> 

---

## 🛠️ Instalación

Ya viene preinstalado en la mayoría de distros. Si no:

```bash
bash
CopyEdit
sudo apt install vim

```

---

## 🧬 Fundamentos (modo de uso)

Vim **no se comporta como otros editores**. Tiene **modos**:

| Modo | Propósito |
| --- | --- |
| `NORMAL` | Navegar, cortar, copiar, borrar, moverse |
| `INSERT` | Escribir texto |
| `VISUAL` | Seleccionar bloques |
| `COMMAND` | Guardar, salir, buscar (`:`) |

### 🧪 Acciones básicas

```bash
bash
CopyEdit
vim archivo.txt        # Abre el archivo
i                      # Entra a modo INSERT
Esc                    # Sale a modo NORMAL
:w                     # Guardar
:q                     # Salir
:wq                    # Guardar y salir

```

---

## 🧠 Filosofía ninja

- En Vim **no se escribe todo el tiempo**.
    
    La mayoría de acciones son de **movimiento, precisión y manipulación**.
    
- En lugar de usar `Ctrl+C`, `Ctrl+V`, en Vim se usan comandos como:
    
    ```bash
    bash
    CopyEdit
    dd      # borrar línea
    yy      # copiar línea
    p       # pegar
    x       # borrar caracter
    dw      # borrar palabra
    /texto  # buscar texto
    
    ```
    

> “Cada tecla es un gesto. Cada gesto, una técnica. Cada técnica… una victoria.”
> 

---

## 🧩 Plugins recomendados

Si querés ir más allá:

- `vim-plug` – gestor de plugins
- `nerdtree` – explorador de archivos
- `lightline` – barra de estado minimal
- `fzf` – búsqueda difusa de archivos
- `vimwiki` – para llevar notas en Markdown como Obsidian

---

## 🧘‍♂️ Reflexión del Sensei

> “Aprender Vim no es aprender a escribir: es aprender a pensar en comandos, en acciones, en formas.”
> 

Cuando otros tardan minutos en mover el cursor, vos ya terminaste.

Cuando otros buscan el mouse… vos ya editaste 10 líneas.

**Vim no es moderno. Es eterno.**
