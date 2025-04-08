## ⚡ `rsync` – *Sincronización eficiente y control total sobre tus archivos*

---

### 🧩 ¿Qué es?

`rsync` es una poderosa herramienta de **copia, sincronización y respaldo de archivos y directorios**.

Su magia está en que **solo transfiere los cambios**, no todo el archivo.

> 🧠 "Mover archivos es una acción... sincronizarlos es un arte."
> 

---

### 🛠️ ¿Para qué sirve?

- Sincronizar carpetas locales o remotas
- Realizar backups incrementales
- Mantener directorios espejo
- Copiar datos a través de red vía SSH
- Automatizar respaldos periódicos

---

### 🚀 ¿Cómo se instala?

```bash
bash
CopyEdit
sudo apt install rsync

```

---

### 📦 Uso básico

```bash
bash
CopyEdit
rsync -av origen/ destino/

```

| Opción | Significado |
| --- | --- |
| `-a` | Modo archivo (preserva permisos, tiempos, etc.) |
| `-v` | Verbose (muestra progreso) |

🔸 El `/` al final **importa mucho**:

- `origen/` → copia el contenido
- `origen` → copia la carpeta entera

---

### 📡 Transferencia por red (SSH)

```bash
bash
CopyEdit
rsync -av archivo.txt usuario@ip:/ruta/destino/

```

También podés **traer archivos** desde otro equipo:

```bash
bash
CopyEdit
rsync -av usuario@ip:/ruta/origen/ ./local/

```

---

### 🔐 Combinado con `cron` o `systemd`

Ideal para automatizar backups diarios:

```bash
bash
CopyEdit
crontab -e

```

```
cron
CopyEdit
0 2 * * * rsync -av ~/documentos/ /mnt/backup/

```

(backup a las 2 AM todos los días)

---

### 🧩 Otras opciones útiles

| Comando | Qué hace |
| --- | --- |
| `--delete` | Borra archivos del destino que ya no están en origen |
| `--progress` | Muestra el progreso |
| `-z` | Comprime los archivos al volar |
| `-e ssh` | Forza conexión cifrada |

---

### 🔗 Integraciones y usos

- Sincronizar entre discos internos y externos
- Respaldar servidores o VPS
- Copiar proyectos a otras máquinas sin perder configuraciones
- Replicar entornos de desarrollo

---

### ✅ Pros

| Ventaja | Detalle |
| --- | --- |
| ⚡ Rápido y eficiente | Solo transfiere los cambios |
| 🔒 Seguro | Usa SSH y mantiene permisos |
| 💡 Versátil | Local o remoto, backups o sincronización |
| 🧙 Script-friendly | Ideal para automatizar tareas |

---

### ❌ Contras

| Contras | Nota |
| --- | --- |
| ⚠️ Potente = Riesgoso | Si se usa mal con `--delete`, podés borrar cosas |
| 🧠 Curva inicial | Requiere práctica para dominar todas las opciones |

---

### 🧙‍♂️ Filosofía ninja

> “Copiar es una acción torpe. Sincronizar… es mantener armonía entre mundos.”
> 
> 
> `rsync` no es solo un comando. Es una **puerta entre sistemas**: rápida, silenciosa y precisa.
>
