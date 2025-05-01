## 🧰 `neofetch` – *Información del sistema con estilo y precisión*

---

### 🧩 ¿Qué es?

**`neofetch`** es una herramienta de terminal que muestra información del sistema de forma rápida y visual, acompañada del logo de tu distribución en arte ASCII.

Ideal para mostrar configuraciones de un vistazo, o como firma técnica en capturas y documentación.

> 🎨 “Conocer tu dojo antes de luchar en él. Mostrarlo con belleza, sin arrogancia.”
> 

---

### 🛠️ ¿Para qué sirve?

- Mostrar información clave de tu entorno: OS, kernel, shell, RAM, CPU, etc.
- Confirmar rápidamente configuraciones tras una instalación
- Presentar tu sistema con estilo en screenshots o documentación
- Añadir como banner al iniciar la terminal (`.bashrc` o `.zshrc`)

---

### ⚙️ ¿Qué muestra?

Por defecto:

- Distro
- Hostname
- Kernel
- Uptime
- Paquetes instalados
- Shell
- Resolución
- Escritorio (Plasma, GNOME, etc.)
- Tema, íconos y fuente
- Uso de memoria y CPU
- Versión de bash/zsh

Todo junto a un logo ASCII que **cambia según tu distro**.

---

### 🧪 Instalación

```bash
bash
CopyEdit
sudo apt install neofetch

```

---

### 🚀 ¿Cómo se usa?

```bash
bash
CopyEdit
neofetch

```

Si querés usarlo automáticamente al abrir la terminal:

```bash
bash
CopyEdit
echo "neofetch" >> ~/.bashrc

```

Y luego:

```bash
bash
CopyEdit
source ~/.bashrc

```

🔧 También podés editar su configuración:

```bash
bash
CopyEdit
nano ~/.config/neofetch/config.conf

```

---

### 🔗 Integraciones y usos

- Capturas para foros, portafolios o proyectos técnicos
- Mostrar specs básicas en scripts o informes
- Combina bien con `screenfetch`, `inxi`, o `lolcat` para efectos
- Integrable en scripts de instalación para mostrar entorno final

---

### ✅ Pros

| Ventaja | Detalle |
| --- | --- |
| ⚡ Muy rápido | Casi instantáneo |
| 🖼️ Visualmente atractivo | Buen impacto en presentaciones |
| 🧩 Altamente configurable | Podés mostrar solo lo que necesitás |
| 📚 Útil para documentar | Ideal en entornos de enseñanza o despliegue |

---

### ❌ Contras

| Contras | Nota |
| --- | --- |
| 🎨 Solo visual | No ejecuta acciones ni profundiza |
| 📦 Puede faltar en distros mínimas | Hay que instalarlo manualmente |

---

### 🧙‍♂️ Filosofía ninja

> “Mostrar no es presumir, es declarar presencia.”
> 
> 
> `neofetch` es tu **bandera silenciosa** en la terminal: muestra tu entorno con respeto y precisión.
>
