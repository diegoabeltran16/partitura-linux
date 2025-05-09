### 🦠 ¿Qué es ClamAV?

**ClamAV** (Clam AntiVirus) es un **antivirus de código abierto** para Linux (también disponible en otros sistemas). Está diseñado principalmente para:

- **Detectar malware, troyanos, virus y archivos sospechosos**
  
- **Analizar correos electrónicos, archivos adjuntos, y sistemas de archivos**
  
- **Integrarse con servidores de correo (ej. Postfix) para escanear mails en tiempo real**
  

Es muy usado en **servidores Linux** (más que en escritorios), sobre todo para proteger archivos compartidos con sistemas Windows.

---

### 🧰 Componentes principales

1. **`clamd`**: el *daemon* (servicio en segundo plano) que hace escaneos bajo demanda o en tiempo real.
  
2. **`clamscan`**: herramienta de línea de comandos para escanear archivos.
  
3. **`freshclam`**: actualiza las bases de datos de virus.
  
4. **Base de datos de firmas**: detecta miles de amenazas, y se actualiza a diario.
  

---

### 🛠️ Ejemplos de uso

#### Escaneo básico:

```bash
clamscan -r /home/usuario
```

(Revisa recursivamente todos los archivos en ese directorio)

#### Escaneo con eliminación automática:

```bash
clamscan -r --remove=yes /home/usuario
```

#### Escaneo solo de archivos infectados:

```bash
clamscan -r --infected /home
```

---

### 🧬 ¿Qué puede detectar?

- Virus conocidos (.exe, .doc, .js maliciosos, etc.)
  
- Scripts peligrosos en macros
  
- Rootkits y exploits (parcialmente)
  
- Archivos sospechosos comprimidos o embebidos
  
- Archivos con firmas heurísticas (potencialmente peligrosos)
  

---

### 🛡️ ¿Deberías usar ClamAV?

**Sí**, si estás en alguno de estos casos:

- Usas Linux como **servidor de correo** o archivos para clientes Windows.
  
- Quieres **escaneos periódicos** como parte de buenas prácticas.
  
- Descargas/examinas archivos de procedencia dudosa.
  
- Estás en un entorno regulado que exige antivirus (aunque en Linux los virus son raros, el cumplimiento importa).
  

---

### ⚠️ Pero ten en cuenta:

- No tiene protección en tiempo real tan avanzada como antivirus comerciales (a menos que configures `clamd` activamente).
  
- No es muy eficiente contra malware nuevo sin las firmas actualizadas.
  

---