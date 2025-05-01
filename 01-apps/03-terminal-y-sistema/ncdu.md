## 🧰 `ncdu` – *Ninja Disk Usage: ver lo que pesa sin distraerte*

### 🧩 ¿Qué es?

**`ncdu`** (NCurses Disk Usage) es una herramienta de terminal que te permite **explorar el uso de espacio en disco**, carpeta por carpeta, **de forma interactiva y ligera**.

Es como usar una balanza mágica que **te dice qué directorios están ocupando espacio**, sin tener que abrir ventanas o instalar herramientas gráficas.

> 🧠 Útil para auditar, limpiar o simplemente entender qué parte del sistema está más "pesada".
> 

---

### 🧰 ¿Para qué sirve?

- Ver qué carpetas ocupan más espacio
- Encontrar archivos olvidados o backups viejos
- Limpiar sistemas que están llenos
- Optimizar el uso del disco en servidores, live systems o entornos técnicos

---

### 🛠️ Instalación

```bash
bash
CopyEdit
sudo apt install ncdu

```

---

### 🚀 ¿Cómo se usa?

Desde la terminal, ejecutá:

```bash
bash
CopyEdit
ncdu

```

o si querés escanear una ruta específica:

```bash
bash
CopyEdit
ncdu /home/usuario

```

---

### 🎮 Controles básicos

| Tecla | Acción |
| --- | --- |
| ↑ ↓ | Moverse entre carpetas |
| ↵ | Entrar a una carpeta |
| `d` | Borrar archivo o carpeta (⚠️ cuidado) |
| `q` | Salir |
| `n` | Ordenar por nombre |
| `s` | Ordenar por tamaño |

---

### 🔍 ¿Qué muestra?

- El tamaño de cada archivo/carpeta en orden descendente
- Porcentaje del total que ocupa
- Total usado en la ruta actual
- Espacio liberado si eliminás algo

> 🧩 Perfecto para diagnosticar por qué se llenó tu disco, sin abrir ningún GUI.
> 

---

### 🔗 Integraciones y contexto de uso

- Funciona increíblemente bien en sesiones **SSH**
- Ideal para distros minimalistas, sistemas embebidos o **USB bootables** (como Ventoy)
- Compatible con sistemas remotos o de recuperación

---

### ✅ Pros

| Ventaja | Por qué importa |
| --- | --- |
| 🧘 Súper liviano | Ideal para cualquier sistema |
| 📊 Visual simple | Información clara e inmediata |
| ⚡ Rápido | Incluso en discos grandes |
| 🧠 Interactivo | Podés navegar y eliminar desde el mismo lugar |

---

### ❌ Contras

| Desventaja | Nota |
| --- | --- |
| 🧨 Elimina permanentemente | Usar con precaución (`d`) |
| 📉 No muestra gráficos | Pero gana en velocidad |

---

### 🥷 Filosofía ninja

> "Una mochila ligera no significa debilidad… significa que llevás solo lo necesario."
> 
> 
> `ncdu` te ayuda a **detectar peso inútil** y afilar tu sistema, dejando solo lo esencial para la misión.
>
