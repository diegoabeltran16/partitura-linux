## 🌀 `tmux` – *Multiplexor de terminal para maestros del entorno shell*

---

### 🧩 ¿Qué es?

`tmux` es un **multiplexor de terminal**:

te permite **dividir una sola terminal en múltiples paneles**, sesiones o ventanas... ¡todo dentro de la misma pantalla!

> 🧠 “Mientras otros abren diez pestañas, tú despliegas un dojo en una sola.”
> 

---

### 🛠️ ¿Para qué sirve?

- Abrir **varias terminales en paralelo**, sin GUI
- **Persistir sesiones** aunque cierres el terminal o te desconectes
- Organizar proyectos en **paneles separados**
- **Trabajar remotamente** sin perder el contexto (VPS, servidores)
- Automatizar entornos de desarrollo (por ejemplo, dividir en shell, logs y editor)

---

### 🚀 ¿Cómo se instala?

```bash
sudo apt install tmux
```

---

### ⚔️ Comandos básicos ninja

| Comando | Acción |
| --- | --- |
| `tmux` | Inicia una sesión |
| `tmux new -s nombre` | Nueva sesión con nombre |
| `tmux ls` | Lista sesiones |
| `tmux attach -t nombre` | Reconecta a una sesión |
| `tmux kill-session -t nombre` | Elimina sesión |

---

### 🎛️ Atajos dentro de `tmux`

La tecla base es `Ctrl + b`, luego presionás otra tecla:

| Tecla | Acción |
| --- | --- |
| `"` | Divide horizontalmente |
| `%` | Divide verticalmente |
| `o` | Cambia de panel |
| `x` | Cierra panel |
| `d` | Detach (salís sin cerrar) |
| `[` | Modo scroll (mover con flechas) |
| `c` | Nueva ventana |
| `n` / `p` | Ventana siguiente / anterior |

> ✨ Podés tener varias ventanas, y dentro de cada una, varios paneles.
> 

---

### 🧩 Integraciones

- Con `vim`, `ranger`, `htop` y otras CLI
- Ideal para equipos DevOps o pentesters que necesitan múltiples procesos visibles
- Junto a `ssh`, permite sesiones remotas persistentes

---

### ✅ Pros

| Ventaja | Por qué |
| --- | --- |
| 🔄 Persistencia | Nada se cierra al cerrar el terminal |
| 🪟 Multiventanas | Podés tener varias tareas a la vez |
| 💡 Organizado | Entornos separados por paneles y sesiones |
| 🧠 Minimalista | Sin necesidad de interfaz gráfica |

---

### ❌ Contras

| Desventaja | Detalle |
| --- | --- |
| 🔧 Curva media | Los atajos toman práctica |
| 🎨 Estética cruda | Sin adornos (a menos que se configuren temas) |

---

### 🧙‍♂️ Metáfora ninja

> “tmux es tu dojo interno. A simple vista, es solo una habitación… pero dentro de ella, podés dividir, replicar, y moverte como un fantasma.”
>
