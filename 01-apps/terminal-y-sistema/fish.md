## 🐚 `fish` — *Friendly Interactive Shell*

### 🧩 ¿Qué es?

`fish` es una shell de línea de comandos moderna y amigable que **reemplaza o complementa Bash/Zsh**. Fue creada para brindar una experiencia **más humana e inteligente desde el primer uso**, sin configuraciones complejas.

### 🧰 ¿Para qué sirve?

- Ejecutar comandos, scripts y automatizaciones
- Navegar por el sistema de archivos
- Trabajar con autocompletado **basado en historial y contexto**
- Tener una terminal más visual y productiva

### ⚙️ ¿Cómo se usa?

Instalación:

```bash
bash
CopyEdit
sudo apt install fish

```

Cambio de shell por defecto:

```bash
bash
CopyEdit
chsh -s /usr/bin/fish

```

Luego reiniciás sesión y ya estarás trabajando con `fish`.

### 🔗 Integraciones:

- Compatible con `oh-my-fish` (framework de personalización)
- Soporte para plugins de autocompletado extendido
- Integración con `fzf`, `bat`, `exa` y otras herramientas modernas

### ✅ Pros:

- Muy amigable, incluso para principiantes
- Autocompletado predictivo y rápido
- Colores, sugerencias, y documentación en tiempo real

### ❌ Contras:

- No es 100% compatible con scripts diseñados solo para Bash
- Algunos devops y scripts antiguos requieren ajustes

> 🧠 Ideal como shell de uso diario. Si trabajás con scripting más complejo, podés mantener Bash como fallback.
>
