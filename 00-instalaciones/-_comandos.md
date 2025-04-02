# 🧰 Comandos esenciales de Linux

🌱 Esta hoja de referencia rápida contiene los comandos fundamentales para orientarte, trabajar y mantener control sobre cualquier sistema GNU/Linux desde la terminal. Ideal para principiantes, entrenamientos o situaciones donde no se cuenta con entorno gráfico.

---

# 📍 Navegación del sistema de archivos

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

## Tu nombre de usuario actual
```bash
whoami         
```
## Info del kernel y arquitectura
```bash
uname -a
```
## Nombre del equipo
```bash
hostname
```
## Tiempo encendido
```bash
uptime         
```
## Espacio en disco
```bash
df -h          
```
## Memoria disponible
```bash
free -h        
```
## Info del procesador
```bash
lscpu          
```
## Dispositivos de almacenamiento
```bash
lsblk          
```

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

