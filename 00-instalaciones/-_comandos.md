# 🧰 Comandos esenciales de Linux

🌱 Esta hoja de referencia rápida contiene los comandos fundamentales para orientarte, trabajar y mantener control sobre cualquier sistema GNU/Linux desde la terminal. Ideal para principiantes, entrenamientos o situaciones donde no se cuenta con entorno gráfico.

---

# 📍 Navegación del sistema de archivos
## 🧭 ¿Qué es el sistema de archivos?

En Linux, **todo es un archivo**: documentos, carpetas, procesos, dispositivos… incluso el hardware se representa como archivos (por ejemplo, `/dev/sda` es tu disco).

El sistema de archivos es una **estructura jerárquica**, con un único punto de partida: la raíz (`/`).

Desde allí, se ramifica como un árbol de técnicas ocultas y secretos del sistema.

---

## 🌳 Jerarquía básica (el árbol ninja)

```
php
CopyEdit
/
├── bin/       # Programas esenciales (binarios ejecutables)
├── boot/      # Archivos de arranque del sistema
├── dev/       # Dispositivos del sistema (hardware)
├── etc/       # Archivos de configuración
├── home/      # Directorios personales de los usuarios
│   └── lorien/
├── lib/       # Bibliotecas compartidas
├── media/     # Unidades montadas como USB
├── proc/      # Información de procesos y kernel (virtual)
├── tmp/       # Archivos temporales
├── usr/       # Programas de usuario
└── var/       # Archivos variables (logs, colas de impresión)

```

Cada directorio tiene un propósito específico.

Conocer esto te permite moverte **con intención** y no al azar.

---

## 🧙‍♂️ Trucos ninja

### Autocompletado:

Cuando escribís rutas, podés presionar `Tab` para autocompletar nombres.

Muy útil para no escribir todo a mano y evitar errores.

### Ruta absoluta vs. relativa:

- **Absoluta**: `/home/lorien/documentos/tesis.txt` (desde raíz)
- **Relativa**: `../documentos/tesis.txt` (desde donde estás)

> 🧠 Saber moverte con rutas absolutas es poder. Usar rutas relativas es agilidad.
> 

---

## 🧩 ¿Y si quiero volver al punto anterior?

Podés usar `cd -` para volver al último directorio en el que estuviste.

```bash
bash
CopyEdit
cd /etc
cd /usr
cd -      # Te lleva de nuevo a /etc

```

---

## 🧘‍♂️ Reflexión final

> “El sistema de archivos no es solo estructura... es reflejo del orden mental del programador.”
> 
> 
> Navegar con precisión, sin GUI, es como moverse en la oscuridad con los ojos abiertos.
> 
> Y cada paso, cada `cd`, es una decisión consciente.
>

## 🛤️ Movimiento

- **`cd`** es tu técnica de desplazamiento: no caminas, *te teletransportás* a otro punto del sistema.
- **`pwd`** te revela el lugar donde estás. Es como mirar tu GPS ninja.
- **`ls`** es tu vista a lo que te rodea.
    - Con `ls -l` ves quién puede tocar cada cosa, y cuándo se usó.
    - Con `ls -a` ves archivos ocultos (`.` archivos de configuración).
- **`tree`** no es parte del sistema base, pero si lo instalás, te da *visión total del bosque* — para cuando necesitás ver toda la estructura de un golpe.

---

## 🔍 `pwd` – **Muestra la ruta del directorio actual**

```bash
pwd
```
📎 *Print Working Directory*
Te dice en qué parte del sistema estás parado.
🔸 Ideal cuando trabajás con scripts o te perdés dentro de muchas carpetas anidadas.
> 🥷 Un ninja que no sabe dónde está, no sabe desde dónde atacar ni hacia dónde escapar.
> 

---

## 📂 `ls` – **Lista archivos**

```bash
ls
```
📎 *List*
Muestra el contenido del directorio actual.
Sin opciones, solo muestra los nombres. Muy útil para tener un vistazo rápido.
> 🌊 Como asomarse al borde del acantilado: sabés que hay algo, pero no su profundidad.
> 

---

## 📊 `ls -l` – **Lista con detalles (permisos, tamaño, fechas)**

```bash
ls -l
```
📎 Muestra:
- Permisos
- Dueño y grupo
- Tamaño en bytes
- Fecha de modificación
- Nombre del archivo o carpeta
🔸 Es clave para auditorías, cuando estás evaluando quién tiene acceso y si algo cambió.
> 🕵️ La vista de halcón del ninja: ve las sombras, no solo las formas.
> 

---

## 📁 `cd nombre/` – **Entra a una carpeta**

```bash
cd nombre/
```
📎 *Change Directory*
Te mueve dentro de una carpeta específica.
🔸 Si combinás con `Tab`, el sistema autocompleta el nombre: más rápido y más seguro.
> 🛤️ Cada carpeta es un camino, pero no todos llevan a donde querés ir.
> 

---

## ⬆️ `cd ..` – **Sube un nivel**

```bash
cd ..
```
📎 Te lleva a la carpeta padre del lugar donde estás.
🔸 Usado para retroceder, organizar scripts o moverte hacia carpetas raíz.
> 🔄 A veces, para avanzar, hay que saber cuándo retroceder.
> 

---

## 🏠 `cd` – **Ir al directorio home**

```bash
cd
```
📎 Sin argumentos, `cd` te lleva directo a tu carpeta personal (`/home/usuario`).
🔸 Muy útil cuando necesitás volver rápido a tu base de operaciones.
> 🏡 El hogar del ninja: simple, silencioso y siempre listo.
> 

---

## 🌲 `tree` – **Muestra estructura de carpetas en forma de árbol**

```bash
tree
```
📎 Requiere que el comando `tree` esté instalado (`sudo apt install tree`).
Muestra jerárquicamente las carpetas y subcarpetas.
🔸 Excelente para visualizar estructuras complejas o planificar backups.
> 📖 Ver el bosque sin perder el árbol. Todo ninja necesita mapa antes de infiltrarse.
> 

---

# 🧠 Información del sistema

Conocer el estado de tu sistema es tan importante como dominar el entorno en una misión.

Estos comandos te permiten hacer un **diagnóstico rápido y efectivo** del entorno donde estás operando —ideal para auditorías, configuraciones iniciales o rescate.

---

## 👤 `whoami` – **Tu nombre de usuario actual**

```bash
whoami
```
📎 Devuelve el nombre del usuario activo que ejecuta la terminal.
🔸 Útil para verificar si estás operando como usuario normal o bajo `sudo`.
> 🧬 “Conocer tu identidad evita cometer errores con poderes que no te corresponden.”
> 

---

## 🧬 `uname -a` – **Info del kernel y arquitectura**
```bash
uname -a
```
📎 Muestra una línea completa con:
- Nombre del sistema
- Versión del kernel
- Arquitectura (x86_64, arm64…)
🔸 Ideal para saber si tu sistema es de 32 o 64 bits, o qué versión de Linux estás usando.
> ⚔️ Un ninja no solo actúa: sabe de qué está hecho su campo de batalla.
> 

---

## 🖥️ `hostname` – **Nombre del equipo**

```bash
hostname
```
📎 Muestra el nombre de red asignado a tu equipo.
🔸 Relevante para configuraciones de red, SSH, y distinguir múltiples equipos conectados.
> 🏷️ En un dojo lleno de guerreros, saber tu nombre te salva de la confusión.
> 

---

## ⏱️ `uptime` – **Tiempo encendido**

```bash
uptime
```
📎 Muestra cuánto tiempo lleva encendido el sistema, cuántos usuarios están conectados y la carga del sistema.
🔸 Útil para detectar reinicios inesperados, estabilidad o duración de sesiones.
> 🧘 La resistencia de un ninja se mide por su permanencia silenciosa.
> 

---

## 💾 `df -h` – **Espacio en disco**
```bash
df -h
```
📎 *Disk Free (human readable)*
Muestra cuánto espacio hay disponible y cuánto está ocupado en cada partición del sistema.
🔸 Ideal para revisar antes de instalar algo grande o mover archivos pesados.
> 📦 Un disco lleno es como una mochila sin espacio: te retrasa y te expone.
> 

---

## 🧠 `free -h` – **Memoria disponible**

```bash
free -h
```
📎 Muestra cuánta RAM y swap están en uso o libres.
🔸 Te ayuda a entender si el sistema está usando la swap (memoria lenta) o si tiene buena capacidad de respuesta.
> 💤 Cuando la mente se satura, el ninja se vuelve lento. Igual pasa con la RAM.
> 

---

## ⚙️ `lscpu` – **Info del procesador**

```bash
lscpu
```
📎 Lista la arquitectura del CPU, núcleos, hilos, modelo, velocidad...
🔸 Ideal para saber cuánta potencia tenés disponible para tareas pesadas, compilación, VMs.
> ⚒️ El corazón del dojo es su forja. El procesador es tu fuego interno.
> 

---

## 📦 `lsblk` – **Dispositivos de almacenamiento**

```bash
lsblk
```
📎 Muestra los discos, particiones, y puntos de montaje.
🔸 Fundamental antes de instalar Ventoy, montar un USB, o identificar una unidad externa.
> 🗺️ Todo ninja debe conocer los caminos del pergamino que porta.
> 

---

# 🔐 Usuario, permisos y superpoderes

## Muestra tu UID y grupos
```bash
id                  
```
## A qué grupos pertenecés
```bash
groups              
```
## Ejecutar con privilegios
```bash
sudo comando        
```
## Cambiar tu contraseña
```bash
passwd              
```
## Hacer ejecutable un script
```bash
chmod +x archivo.sh 
```

---

# 📁 Archivos y edición

## Ver contenido
```bash
cat archivo.txt        
```

## Editar en modo terminal
```bash
nano archivo.txt       
```

## Copiar archivo o carpeta
```bash
cp origen destino      
```

## Mover o renombrar
```bash
mv origen destino      
```

## Eliminar archivo
```bash
rm archivo.txt         
```

## Crear carpeta
```bash
mkdir nueva/           
```

## Crear archivo vacío
```bash
touch nuevo.txt        
```

---

# 📦 Paquetes y actualizaciones

## Actualizar lista de paquetes (Debian/Ubuntu)
```bash
sudo apt update             
```

## Actualizar los paquetes instalados
```bash
sudo apt upgrade            
```

## Instalar un paquete
```bash
sudo apt install nombre     
```

## Eliminar un paquete
```bash
sudo apt remove nombre      
```

---

# 🔄 Procesos y recursos

## Listar procesos en ejecución
```bash
ps aux                 
```

## Vista en tiempo real (o usar htop)
```bash
top                    
```

## Terminar proceso (PID = número del proceso)
```bash
kill PID               
```

---

# 🌐 Red y conectividad

## Ver interfaces de red
```bash
ip a                   
```

## Probar conexión a internet
```bash
ping google.com        
```

## Ver tu IP pública
```bash
curl ifconfig.me       
```

---

# 🧠 Consejos

- Usá `man comando` para ver el manual de cualquier herramienta
- Agregá alias personalizados en tu `.bashrc` para comandos largos
- Todo comando puede combinarse con pipes `|` y redirecciones `>` para automatizar

---

# 📜 Nota final

> *“Saber moverse en la terminal es como saber respirar bajo el agua.”*  
> Dominar estos comandos te hará operar con precisión, incluso sin entorno gráfico.

