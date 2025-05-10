## ⚙️ `htop` — *El dojo visual del sistema*

### 🧩 ¿Qué es?

**`htop`** es un **monitor interactivo de procesos**, más moderno, colorido y amigable que el viejo comando `top`.

Te permite:

- Ver qué procesos están activos
- Cuánta CPU, RAM y swap consumen
- Matar o priorizar tareas
- Navegar y filtrar fácilmente con el teclado

> 📊 Es como tener un radar ninja de todo lo que pasa en el sistema, pero con visión clara y control directo.
> 

---

### 🧰 ¿Para qué sirve?

- Detectar procesos que consumen demasiados recursos
- Ver el estado general del sistema
- Monitorear en tiempo real
- Terminar procesos colgados
- Identificar cuellos de botella

---

### 🚀 Instalación

```bash
sudo apt install htop
```

---

### 🧪 ¿Cómo usarlo?

Ejecutalo desde terminal:

```bash
htop
```

Controles básicos:

| Tecla | Acción |
| --- | --- |
| ↑ ↓ | Navegar entre procesos |
| F3 | Buscar |
| F4 | Filtrar |
| F6 | Ordenar columnas |
| F9 | Matar proceso |
| F10 | Salir |

---

### 🔍 ¿Qué muestra?

- **Barras de CPU y RAM** (coloridas)
- **Load average** (promedio de carga)
- Lista de procesos con:
    - PID
    - Usuario
    - %CPU
    - %MEM
    - Tiempo activo
    - Comando

> 🧠 Mucho más visual y útil que top, sobre todo para usuarios nuevos o en auditoría en campo.
> 

---

### 🔗 Integraciones

- Ideal para usar junto a `tmux`, `screen`, o dashboards de sistema
- Útil en servidores remotos o dispositivos con pocos recursos
- Compatible con entornos Live (como Tails, Kali, Parrot)

---

### ✅ Pros

| Ventaja | Por qué es útil |
| --- | --- |
| 🎨 Interfaz visual | Rápido de leer y navegar |
| 🧠 Interactivo | Control total desde teclado |
| 📋 Muestra todo el sistema en vivo | Ideal para monitoreo |
| 🔧 Personalizable | Podés reordenar columnas |

---

### ❌ Contras

| Desventaja | Consideración |
| --- | --- |
| 🔋 Puede consumir más CPU que `top` | Mínimo impacto |
| 🔐 Requiere privilegios para ver todo | Usar `sudo` si es necesario |
| ⚙️ No modifica cosas por sí solo | Es solo visual; las acciones son tuyas |

---

### 🥷 Filosofía ninja

> "Ver no es suficiente. El ninja también comprende el flujo de energía."
> 
> 
> `htop` no solo te muestra qué pasa, **te entrena a detectar anomalías y actuar en consecuencia**.
> 

---
