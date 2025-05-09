# 📍 Navegación del sistema de archivos
## 🧭 ¿Qué es el sistema de archivos?
En Linux, **todo es un archivo**: documentos, carpetas, procesos, dispositivos… incluso el hardware se representa como archivos (por ejemplo, `/dev/sda` es tu disco).

El sistema de archivos es una **estructura jerárquica**, con un único punto de partida: la raíz (`/`).
Desde allí, se ramifica como un árbol de técnicas ocultas y secretos del sistema.

## 🌳 Jerarquía básica (el árbol ninja)

```php
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

## Trucos ninja
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

En Linux, **todo está gobernado por usuarios y permisos**.
No hay GUI ni efecto visual que te salve si no sabés cómo funciona el sistema de privilegios.
Cada acción está atada a una identidad, y cada identidad tiene un rango de poder.

---

## 🆔 `id` – **Muestra tu UID y grupos**

```bash
id
```
📎 Muestra tu ID de usuario (`uid`), grupo principal (`gid`) y grupos secundarios.
🔸 Es útil para entender con qué permisos te estás moviendo y qué recursos podés acceder.
> 📜 Hasta el ninja más sigiloso deja una firma. Saber quién sos en el sistema es clave para no pisar una trampa.
> 

---

## 🧪 `groups` – **A qué grupos pertenecés**

```bash
groups
```
📎 Lista los grupos a los que pertenecés.
🔸 En Linux, los permisos también se asignan por grupo. Si sos parte de `sudo`, tenés acceso a superpoderes 🥷⚡.
> 🔓 Los grupos son como clanes: te otorgan habilidades especiales según tu afiliación.
> 

---

## 🔑 `sudo comando` – **Ejecutar con privilegios**

```bash
sudo comando
```

📎 Ejecuta un comando como **root** (el usuario con poder absoluto).
🔸 Usá `sudo` cuando necesites instalar software, modificar configuraciones críticas, o cambiar permisos avanzados.
> ⚠️ Un ninja sabio no invoca poder sin necesidad. Cada sudo debe ser meditado.
> 

---

## 🔐 `passwd` – **Cambiar tu contraseña**

```bash
passwd
```
📎 Te permite modificar tu contraseña actual.
🔸 Si sos root o usás `sudo passwd usuario`, podés cambiar la de otros.
> 🗝️ Un ninja protege su identidad. La contraseña es tu sello personal.
> 

---

## ⚔️ `chmod +x archivo.sh` – **Hacer ejecutable un script**
```bash
chmod +x archivo.sh
```

📎 Cambia los permisos de un archivo para que pueda ser ejecutado (`+x` significa “eXecutable”).
🔸 Esencial al crear scripts personalizados o herramientas propias.
> 🛡️ Los permisos son como sellos de invocación. Si no están firmados, no se activan.
> 

---

### 🧘‍♂️ Reflexión táctica:

El sistema de permisos en Linux tiene tres niveles:
🔹 **Usuario** (u)
🔹 **Grupo** (g)
🔹 **Otros** (o)
Y tres tipos de acceso:
🔸 **Lectura** (r)
🔸 **Escritura** (w)
🔸 **Ejecución** (x)

Cada archivo tiene una “matriz” de protección que se ve con `ls -l`:

```
-rwxr-xr--
```
> Dominar los permisos es como aprender a sellar puertas: sabrás quién entra, quién mira y quién actúa.
> 

---
# 📁 Archivos y edición

## 🧱 Fundamentos

En Linux, los archivos son **el corazón del sistema**: todo es un archivo, desde configuraciones hasta procesos.
Saber crearlos, moverlos o destruirlos es parte de tu entrenamiento esencial.

---

## 📖 `cat archivo.txt` – **Ver contenido**

```bash
cat archivo.txt
```
📎 *Concatenate / Mostrar*
🔸 Muestra el contenido de un archivo en pantalla.
🔹 También se usa para combinar archivos: `cat archivo1 archivo2 > nuevo.txt`
> 👁️ La lectura es el primer paso del entendimiento. Mirá antes de actuar.
> 

---

## 📝 `nano archivo.txt` – **Editar en modo terminal**

```bash
nano archivo.txt
```
📎 Editor de texto ligero en la terminal.
🔸 Ideal para configurar scripts, editar archivos `.conf` o tomar notas rápidas.
> 🖋️ Un ninja también escribe: sin dejar rastro, pero dejando huella.
> 
> 🧠 Guardar: Ctrl + O, salir: Ctrl + X
> 

---

## 🧬 `cp origen destino` – **Copiar archivo o carpeta**

```bash
cp archivo.txt copia.txt
cp -r carpeta1/ carpeta2/
```
📎 *Copy*
🔸 Copia archivos o carpetas (`-r` para recursivo).
🔹 Esencial para hacer backups, duplicar configuraciones o preparar entornos.
> 🧪 Cada copia es un reflejo. A veces el reflejo se vuelve arma.
> 

---

## 🎭 `mv origen destino` – **Mover o renombrar**

```bash
mv archivo.txt /otra/ruta/
mv viejo.txt nuevo.txt
```

📎 *Move*
🔸 Mueve un archivo/carpeta o lo renombra si el destino es un nombre.
> 🥷 Desaparecer de un lugar y aparecer en otro. Sin dejar rastro.
> 

---

## ☠️ `rm archivo.txt` – **Eliminar archivo**

```bash
rm archivo.txt
rm -r carpeta/
```
📎 *Remove*
🔸 Borra archivos permanentemente. Usa `-r` para carpetas.
⚠️ ¡No hay papelera! Precaución con `sudo` o `rm -rf`.
> 🔥 Eliminar es parte del camino. Pero solo el sabio sabe cuándo destruir.
> 

---

## 🏗️ `mkdir nueva/` – **Crear carpeta**

```bash
mkdir nueva/
```
📎 *Make Directory*
🔸 Crea una nueva carpeta.
🔹 Podés crear varias o anidadas con `mkdir -p ruta/otra/mas/`
> 🏯 El ninja construye su refugio antes de entrar en batalla.
> 

---

## ✨ `touch nuevo.txt` – **Crear archivo vacío**

```bash
touch nuevo.txt
```
📎 *Toca* un archivo: lo crea si no existe, o actualiza su fecha si ya existe.
🔸 Muy útil para generar archivos rápidos o iniciar registros.
> 📜 Todo empieza con una hoja en blanco. Touch es el primer golpe del pincel.
> 

---

### 🎯 Sugerencia de práctica:

```bash
mkdir NOMBRECARPETA/
cd NOMBRECARPETA
touch nota.txt
echo "No hay raíz..." > nota.txt
cat nota.txt
mv nota.txt pergamino.txt
nano pergamino.txt

```

> Así entendés cómo crear, escribir, renombrar y leer... sin GUI, solo con tu terminal y tu chakra.
> 

---
# 📦 Paquetes y actualizaciones

> 🧠 Un sistema sin actualizaciones es como una katana sin afilar.
> 

## 📦 ¿Qué son los paquetes?

Un **paquete** es como una caja que contiene software.
Dentro puede haber:
- Un programa
- Archivos de configuración
- Librerías necesarias
- Scripts de instalación
👉 En Debian (y derivadas como Ubuntu), estos paquetes terminan en `.deb`.
Cuando instalás algo con `sudo apt install`, estás diciéndole a tu sistema:
> “Traé esta caja del almacén oficial y desempaquetala en el sistema”.
> 

### 📚 ¿Dónde están esos paquetes?
Vienen desde **repositorios**, que son servidores confiables llenos de herramientas.

Cuando ejecutás:
```bash
sudo apt update
```
Le estás diciendo a tu sistema:
> “Consultá al dojo central si hay nuevas técnicas disponibles”.
> 
Y con:
```bash
sudo apt upgrade
```
> “Entrená todas las técnicas instaladas a su última versión segura.”
> 

---

### 🧙‍♂️ ¿Por qué importa?

Actualizar tus paquetes:
- Corrige **vulnerabilidades** (seguridad)
- Mejora rendimiento o estabilidad
- Te da acceso a **nuevas funciones**

Y lo mejor: lo hacés con **2 comandos**.

No necesitás un “Windows Update” con reinicios infinitos.

| Concepto | Qué es | Para qué sirve |
| --- | --- | --- |
| `paquete` | Caja con software | Instalar programas |
| `repositorio` | Almacén remoto | Fuente confiable de paquetes |
| `apt update` | Consulta a los repos | Ver si hay novedades |
| `apt upgrade` | Entrena las técnicas | Actualiza lo que ya tenés |
---

## 🔄 `sudo apt update` – **Actualizar lista de paquetes**

```bash
sudo apt update
```
📎 Refresca el índice de los repositorios: le dice al sistema cuáles versiones están disponibles.
🔸 No instala nada, solo actualiza la “lista de compras”.
> 🧭 Antes de moverte, revisá el mapa. Este comando sincroniza tu sistema con el dojo central.
> 

---

## 🧪 `sudo apt upgrade` – **Actualizar los paquetes instalados**

```bash
sudo apt upgrade
```
📎 Instala las nuevas versiones de los paquetes que ya tenés.
🔸 Ideal hacerlo después de `apt update`.
🔹 Para actualizar todo sin preguntas: `sudo apt upgrade -y`
> ⚔️ Actualizar es entrenar a tus herramientas. Las versiones viejas son armas oxidadas.
> 

---

## 🛠️ `sudo apt install nombre` – **Instalar un paquete**

```bash
sudo apt install nombre
```
📎 Descarga e instala programas desde los repositorios oficiales.
🔸 Ejemplo: `sudo apt install neofetch`
> 🎒 Cada herramienta es una técnica. Elegí bien qué cargás en tu mochila.
> 

---

## 🧹 `sudo apt remove nombre` – **Eliminar un paquete**

```bash
sudo apt remove nombre
```

📎 Elimina un programa, pero puede dejar archivos de configuración.
🔹 Para limpieza profunda: `sudo apt purge nombre`
> 🧼 Eliminar lo que no usás es parte del arte del sigilo. El ninja no carga peso innecesario.
> 

---

# 🔄 Procesos y recursos

> Un ninja no solo observa el sistema… lo escucha, lo siente, lo vigila desde dentro.
> 

## 🔄 ¿Qué son los procesos?

Un **proceso** es un programa en ejecución.
Por ejemplo:
- Si abrís Firefox → hay un proceso corriendo
- Si corrés un script → se vuelve proceso
- Incluso cosas invisibles (como el servidor de red) son procesos

Podés verlos con:
## 👁️ `ps aux` – **Listar procesos en ejecución**

```bash
ps aux
```

📎 Muestra todos los procesos activos: usuario, PID, uso de CPU/RAM, comandos.
🔸 Ideal para saber qué está corriendo detrás de escena.
> 🧙 El arte de ver sin ser visto. Saber quién actúa es saber a quién detener.
> 

---

## 🌡️ `top` – **Vista en tiempo real del sistema**

```bash
top
```

📎 Muestra una interfaz en vivo de procesos, CPU, RAM, uso de swap…
🔹 Alternativa más amigable: `htop` (requiere instalación)
> 🧭 Es tu radar ninja: ves todo lo que respira dentro del sistema.
> 

---

## ☠️ `kill PID` – **Terminar proceso**

```bash
kill 1234
```
📎 Finaliza un proceso usando su ID (PID). Usá `ps aux` o `top` para encontrarlo.
🔹 Para forzar: `kill -9 PID`
> 💀 A veces, una técnica se descontrola. Este comando la sella.
> 

---

### 🌀 Extra: combo ninja

```bash
ps aux | grep firefox
kill PID
```

🔸 Filtra procesos por nombre y elimina el que quieras.
> 🕶️ Identificá, apunta, elimina. Precisión en cada línea.
>
---

# 🌐 Red y conectividad

En Linux, entender la red es como leer el viento en el campo de batalla: **sutil, constante y vital**.

## 📡 `ip a` – **Ver interfaces de red**

```bash
ip a
```

📎 Muestra todas las interfaces de red del sistema:
- Direcciones IP
- Estado de conexión (UP/DOWN)
- Interfaces como `eth0`, `wlan0`, `lo`, etc.

🔸 Ideal para:
- Ver si tu equipo tiene IP asignada
- Diagnosticar problemas de conexión
- Saber si estás usando cable, WiFi o VPN

> 🧙‍♂️ Este comando reemplaza al antiguo ifconfig. Más preciso, más completo.
> 

---

## 📶 `ping` – **Probar conexión a internet**

```bash
ping google.com
```

📎 Envía paquetes al destino y mide el tiempo de respuesta.
- Si ves respuestas → estás en línea.
- Si no hay respuesta → hay problema de red.

🔸 Útil para:
- Verificar si tenés conexión
- Medir latencia
- Diagnosticar caídas o bloqueos de DNS

> 🥷 Ping es el "eco" del ninja: si vuelve, el camino está libre.
> 

---

## 🌍 `curl ifconfig.me` – **Ver tu IP pública**

```bash
curl ifconfig.me
```

📎 Consulta un servicio web para mostrar tu **IP externa**.
- Es la dirección que los sitios web ven cuando navegás.
- Muy útil si estás usando VPN o querés saber si estás expuesto.

> 🧠 Ideal para auditorías, anonimato y control de fugas.
> 

---

## 🧠 Extra ninja tips

- Usá `ping 8.8.8.8` si querés saber si falla **la red o el DNS**.
- Usá `ip r` para ver tu **ruta de salida (gateway)**.
- Usá `nmcli` para controlar conexiones sin entorno gráfico (NetworkManager).

---

> “Quien controla la red, controla el flujo.
Quien entiende la red, se mueve sin ser visto.”
>

---

# 🧠 Consejos

- Usá `man comando` para ver el manual de cualquier herramienta
- Agregá alias personalizados en tu `.bashrc` para comandos largos
- Todo comando puede combinarse con pipes `|` y redirecciones `>` para automatizar

---

# 📜 Nota final

> *“Saber moverse en la terminal es como saber respirar bajo el agua.”*  
> Dominar estos comandos te hará operar con precisión, incluso sin entorno gráfico.

