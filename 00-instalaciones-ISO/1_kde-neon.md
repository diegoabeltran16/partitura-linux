## 🧠 ¿Qué es KDE?

**KDE** es una comunidad global que desarrolla software libre.

Su proyecto insignia es **KDE Plasma**, un entorno de escritorio moderno, modular y altamente configurable que corre sobre sistemas GNU/Linux.

> KDE no es solo “una interfaz bonita”: es una filosofía de diseño orientada a la eficiencia, la estética y el control total por parte del usuario.
> 

---

## 💎 ¿Qué es KDE Plasma?

**Plasma** es el entorno gráfico desarrollado por KDE. Se destaca por:

- ✨ Interfaz limpia, elegante y altamente personalizable
- 🧠 Bajo consumo de recursos en comparación con su estética moderna
- 🔌 Integración con widgets, atajos, paneles dinámicos
- 🧑‍💻 Ideal para usuarios técnicos y desarrolladores: todo es visible y modificable

> Plasma no se impone. Se adapta a tu forma de trabajar.
> 

---

## 🚀 ¿Qué es KDE Neon?

**KDE Neon** es una distribución basada en **Ubuntu LTS (Long Term Support)**, mantenida por la misma comunidad KDE.

📦 ¿Su propósito?

- Brindarte siempre la **última versión de Plasma** y las aplicaciones de KDE
- Sobre una base **estable y confiable** como Ubuntu
- Sin incluir software extra innecesario

---

## 🔥 ¿Por qué KDE Neon y no otra distro con Plasma?

| Distro | Base | Actualización de Plasma | Filosofía |
| --- | --- | --- | --- |
| KDE Neon | Ubuntu LTS | Siempre la más reciente | Lo último de KDE, estable |
| Kubuntu | Ubuntu LTS | Menos frecuente | Más conservadora |
| Manjaro KDE | Arch | Muy frecuente | Más bleeding-edge |
| Fedora KDE Spin | Fedora | Moderadamente frecuente | Más neutral |

Elegiste **KDE Neon** porque querés:

✅ Lo último del entorno KDE

✅ Una base sólida y compatible (como Ubuntu)

✅ Belleza + rendimiento + control

✅ Y una distribución lista para personalizar, sin bloatware

---

## 🧙‍♂️ Metáfora ninja

> KDE Neon es como una katana recién forjada por los mejores herreros (la comunidad KDE), montada sobre una vaina confiable (Ubuntu). Plasma es la técnica de combate, y vos decidís el estilo.
>
# ⚙️ Primeros ajustes tras instalar **KDE Neon**

> “Donde el entorno es silencioso, la mente se vuelve precisa.”
> 

---

## 🧩 1. Actualizar el sistema

Antes de cualquier cosa:

```bash
sudo apt update && sudo apt upgrade
```

🔸 Esto asegura que todo esté al día, especialmente el entorno gráfico y las herramientas de base.

## 🧽 **Paso 2 – Limpieza de software preinstalado**

> "Un ninja no carga peso extra. Cada herramienta tiene un propósito. El resto... solo es ruido."
> 

KDE Neon ya es bastante ligero comparado con otras distros, pero aún así incluye software que quizás **no necesitás** si vas a trabajar en modo técnico, discreto y enfocado.

---

### ❌ Software que podés considerar remover:

| Paquete | Descripción | ¿Remover? |
| --- | --- | --- |
| `libreoffice-*` | Suite ofimática completa (Writer, Calc…) | ✅  Si usás Markdown, LaTeX o editores simples |
| `thunderbird` | Cliente de correo | ✅  Si accedés desde navegador o no usás correo local |
| `elisa` | Reproductor musical de KDE | ✅  Si usás VLC o no reproducís música localmente |
| `kmahjongg`, `ksudoku`, `kmines`, etc. | Juegos KDE | ✅  Herramientas recreativas innecesarias |
| `konversation` | Cliente IRC | ✅  Si no usás IRC |
| `kwalletmanager` | Gestor de contraseñas KDE | ❓  Solo si usás GPG o métodos externos |
| `okular` | Visor de PDF potente | ❌  Recomendado mantener, es muy útil |
| `firefox` | Navegador web | ❌  Recomendado, aunque podrías cambiar por Brave o Tor Browser |
| `neochat` | Cliente de mensajería Matrix | ✅  A menos que uses esa red |

---

### 🧹 Comando recomendado para limpiar

```bash
sudo apt remove --purge libreoffice-* thunderbird elisa konversation kmahjongg ksudoku kmines 
sudo apt autoremove
```

🧠 **Tips**:

- `-purge` elimina también configuraciones.
- `apt autoremove` limpia dependencias huérfanas.

---

### 🤔 ¿Por qué hacerlo?

- **Privacidad**: Menos software preinstalado significa menos vectores de fuga o telemetría no controlada.
- **Velocidad**: Menos procesos al arranque.
- **Claridad mental**: Solo ves lo que usás.
- **Filosofía**: No tener software “por defecto” es un paso hacia el dominio total de tu entorno.

---

### 💡 Consejo ninja

> “Un escritorio no debe parecer una feria.
Un entorno es un templo: cada ícono debe tener un motivo para existir.”
>

## 🧱 **Paso 3 – Herramientas esenciales para un entorno ninja (mínimo, fuerte y expansible)**

> “Sin espada no hay combate. Sin shell, no hay camino.”
> 

Aquí no solo instalás software: elegís tus técnicas.

Lo dividiremos en **bloques funcionales**, para que elijas lo que se alinea con tu estilo.

---

### ⚔️ 1. **Terminal reforzada**

```bash
sudo apt install fish neofetch tmux htop
```

| Herramienta | Función | Comentario Ninja |
| --- | --- | --- |
| `fish` | Shell moderna, con autocompletado mágico | Clara, rápida, hermosa |
| `neofetch` | Muestra info del sistema en terminal | Presentación elegante del sistema |
| `tmux` | Multiplexor de terminal (varias sesiones) | Ideal para sesiones remotas o estructuradas |
| `htop` | Monitor de procesos interactivo | Mejor que `top` para ver RAM, CPU, matar procesos |

---

### 📂 2. **Gestión de archivos y sistema**

```bash
sudo apt install ranger ncdu rsync
```

| Herramienta | Función | Para qué sirve en tu dojo |
| --- | --- | --- |
| `ranger` | Navegador de archivos en terminal | Para explorar con teclado y precisión |
| `ncdu` | Ver uso de disco en terminal | Identifica carpetas pesadas |
| `rsync` | Copia eficiente, ideal para backups | Transferencias seguras, incrementales |

---

### 🌐 3. **Navegación y conexión**

```bash
sudo apt install curl wget nmap whois net-tools
```

| Herramienta | Uso |
| --- | --- |
| `curl`, `wget` | Descargar archivos, consultar APIs |
| `nmap` | Escanear redes (auditoría) |
| `whois` | Información de dominios |
| `net-tools` | Incluye `ifconfig`, `netstat`, etc. |

---

### 🧪 4. **Seguridad y privacidad base**

```bash
sudo apt install gnupg pinentry-gtk2
```

| Herramienta | Uso |
| --- | --- |
| `gnupg` | Cifrado, firmas digitales (GPG) |
| `pinentry` | Ventana gráfica para ingresar contraseñas GPG |

💡 También podés instalar **`veracrypt`**, pero desde repositorio externo.

---

### 🧠 5. **Productividad & edición**

```bash
sudo apt install vim nano bat
```

| Herramienta | Comentario |
| --- | --- |
| `vim` | Editor poderoso (requiere curva) |
| `nano` | Editor básico, fácil |
| `bat` | Alternativa moderna a `cat` |

---

### 🧰 6. **Recomendaciones visuales y útiles para KDE Plasma**

```bash
sudo apt install krusader filelight ark
```

| Herramienta | Uso |
| --- | --- |
| `krusader` | Explorador tipo doble panel (pro) |
| `filelight` | Visualizar uso de disco en gráfico radial |
| `ark` | Descompresor de archivos gráfico |

---

## ✨ Instalación rápida recomendada

```bash
sudo apt update && sudo apt install fish neofetch tmux htop ranger ncdu rsync curl wget nmap whois net-tools gnupg pinentry-gtk2 vim nano bat krusader filelight ark

```

---

## 📌 Bonus opcional

- 🧠 Si programás en Python:
    
    ```bash
      
    sudo apt install python3-pip ipython
    
    ```
    
- 🧪 Si hacés hacking ético o red:
    
    ```bash
    sudo apt install netcat wireshark
  
    ```
    

---

## 🧘‍♂️ Reflexión del Sensei

> “Un sistema no debe estar lleno… debe estar afilado.”
> 
> 
> Elegí tus herramientas como un ninja: pocas, silenciosas y letales en su propósito.
> 

---

# 🎨 Paso 4 – Personalización visual y estética tipo iOS/macOS

> “Una katana pulida no solo corta… también refleja.”
> 
> 
> Un entorno cuidado **inspira concentración, reduce ruido visual y aumenta la fluidez**.
> 

---

## 🧩 Filosofía visual del estilo Apple

macOS se caracteriza por:

- Bordes redondeados y transparencia
- Colores neutros y limpios
- Tipografía clara
- Uniformidad de íconos
- Gestos suaves y animaciones discretas

KDE Plasma **te permite replicar y superar esa estética**, con gran libertad.

---

## 🖌️ 1. Cambiar tema visual general

### 🎨 Recomendado: **Layan**, **WhiteSur**, **Sweet** o **McMojave**

**Instalación (método universal)**

```bash
sudo apt install git
mkdir ~/.themes && cd ~/.themes
git clone https://github.com/vinceliuice/Layan-kde.git
cd Layan-kde
./install.sh
```

> 📦 También podés encontrar temas desde Preferencias del sistema → Apariencia → Tema global
> 

---

## 🧱 2. Íconos estilo Apple

```bash
mkdir ~/.icons && cd ~/.icons
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh

```

> También podés probar Tela, Papirus, Fluent o BeautyLine.
> 

---

## 💠 3. Fuentes y tipografía elegante

```bash
sudo apt install fonts-noto fonts-firacode fonts-cantarell
```

🔸 Luego ve a:

**Preferencias del sistema → Tipografía**

y seleccioná `Noto Sans`, `Fira Sans` o `SF Pro Display` (si la importás).

---

## 🪟 4. Bordes de ventana y estilo visual

- Activá **blur/transparencias**:
    
    `Preferencias del sistema → Compositor → Activar desenfoque en ventanas`
    
- Estilo recomendado: **Breeze Twilight**
    
    (oscuro con elementos claros, como macOS Big Sur)
    

---

## 🧲 5. Dock tipo macOS (estilo panel inferior)

Instalá **Latte Dock** (dock flotante):

```bash
sudo apt install latte-dock
```

Luego:

- Lanzalo: `latte-dock &`
- Click derecho → Preferencias → Estilo → “MacOS”
- Añadí aplicaciones favoritas
- Podés reemplazar el panel inferior tradicional de Plasma

---

## 🎛️ 6. Fondo de pantalla y detalles finales

- Usá fondos tipo “minimalismo abstracto” o estilo Big Sur:
    
    https://unsplash.com/
    
    https://www.pling.com/ (categoría: Wallpapers KDE)
    

# Inicio de sesión (SDDM) al estilo macOS

KDE Neon (y muchas distros Plasma) usan **SDDM** como gestor de sesiones (login).

### 🎨 1. Descargar un tema tipo macOS

Te recomiendo alguno de estos temas visualmente fieles:

- **sddm-sugar-candy** (con soporte de blur)
- **sddm-theme-deepin**
- **sddm-macOS**

### 🔧 Instalación paso a paso:

```bash
# 1. Crear carpeta si no existe
sudo mkdir -p /usr/share/sddm/themes

# 2. Ir a una carpeta temporal
cd ~/Descargas

# 3. Descargar e instalar tema sugar-candy como ejemplo
git clone https://github.com/sddm/sddm-theme-sugar-candy.git
cd sddm-theme-sugar-candy
sudo mv sugar-candy /usr/share/sddm/themes/

# 4. Editar configuración de SDDM
sudo nano /etc/sddm.conf

```

Y asegurate de que esté así:

```
ini
CopyEdit
[Theme]
Current=sugar-candy

```

> También podés usar:
> 

```bash
sudo sddm --example-config > /etc/sddm.conf
```

---

### 🧠 Personalización del tema

- Muchos temas permiten **editar el archivo `theme.conf`**
    
    Para ajustar logo, texto, color, transparencia, reloj...
    

---

### 🔒 Pantalla de bloqueo (lock screen)

La pantalla de bloqueo en Plasma se llama **KSplash** y **Lockscreen**.

### Cambiar desde GUI:

```
Preferencias del sistema → Pantalla de bienvenida → Tema de arranque y bloqueo

```

Temas recomendados:

- **breeze-light** con fondo claro
- **Big Sur Lock** (en store.kde.org)

---

## 🌐 Fuentes para temas visuales KDE/SDDM

- https://store.kde.org/
- https://github.com/sddm

---

### ☁️ Resultado

✅ Pantalla de login translúcida y elegante

✅ Tipografía limpia y sin ruido

✅ Bloqueo visual coherente con el resto del entorno

✅ Ideal para mantener estilo incluso antes de ingresar

---

## 🧠 Consejos ninja de estética

| Acción | Propósito ninja |
| --- | --- |
| Eliminar animaciones lentas | Más velocidad |
| Elegir colores planos | Menos distracción |
| Iconos uniformes | Mayor foco visual |
| Tipografía clara | Reducción de fatiga |

---

## 🎯 Resultado esperado

✅ Minimalismo elegante

✅ Funcionalidad visual clara

✅ Velocidad de respuesta

✅ Entorno que no interfiere con tu concentración

> “No se trata de parecer Mac… sino de tener un entorno que no te distraiga de la misión.”
> 

---

# Paso 5: Terminal afilada

## 🔧 Optimización, personalización y dominio de tu herramienta más poderosa

### 🌌 ¿Por qué afilar la terminal?

La terminal no es solo una línea negra con letras:

es tu **espada**, tu canal de comunicación con el sistema, y el lugar donde cualquier truco, automatización o auditoría comienza.

---

## 🧰 1. Instalar herramientas esenciales

Algunos comandos útiles pueden no venir preinstalados. Vamos a por ellos:

```bash
sudo apt update && sudo apt install neofetch htop tree curl wget git
```

- `neofetch`: muestra info del sistema con estilo
- `htop`: monitor visual de procesos (más intuitivo que `top`)
- `tree`: muestra carpetas como un árbol
- `curl` y `wget`: herramientas para descargas
- `git`: control de versiones y clonación de proyectos

---

## 🎨 2. Personalizar el prompt

Editamos el archivo `.bashrc` para que tu consola diga algo más… *tuyo*:

```bash
nano ~/.bashrc
```

Y al final, agregás algo como:

```bash
# Mostrar info básica al abrir terminal
neofetch

# Prompt personalizado (ejemplo simple)
export PS1="\[\e[1;36m\]\u@\h:\w \$ \[\e[0m\]"

```

> 🧠 Con eso el prompt muestra usuario, host, ruta, y cambia de color.
> 

Luego recargás:

```bash
source ~/.bashrc
```

---

## 🎭 3. Alias secretos (atajos ninja)

Agregá alias útiles a tu `.bashrc` o `~/.bash_aliases`:

```bash
alias cls='clear'
alias ll='ls -lah'
alias gs='git status'
alias update='sudo apt update && sudo apt upgrade'

```

> 🧩 Usar alias no es solo comodidad. Es mantener los dedos en modo sigilo.
> 

---

## 🧪 4. Sugerencias opcionales: con ZSH

Para una experiencia avanzada y estética:

```bash
sudo apt install zsh

```

Y luego:

```bash
chsh -s $(which zsh)

```

Combinado con:

- [`Oh-My-Zsh`](https://ohmyz.sh/)
- Temas como **powerlevel10k**
- Plugins: autosuggest, syntax highlighting

> Esta opción te da un shell hiper-reactivo, ideal para productividad y hacking ético ⚡
> 

---

## 💡 5. Comandos de calentamiento

Para practicar:

```bash
lsblk       # ver discos
df -h       # ver espacio
ip a        # ver IPs
uname -a    # ver kernel
ps aux      # ver procesos

```

---

## 🎯 Resultado esperado

✅ Terminal ligera y rápida

✅ Estética clara con información útil

✅ Comportamiento coherente, adaptable a tus hábitos

✅ Te sentís en casa al abrir una shell, sin importar el entorno

---

> “El que domina su terminal, domina su entorno.”
>

# 🌐 Paso 6: Conexión y Red

## Dominio silencioso del entorno digital

---

## 🧭 ¿Por qué es importante?

En Linux, **la red no está hecha para solo "conectarse a internet"**.

También es un campo de exploración, auditoría, diagnóstico, anonimato o incluso evasión.

Conocer cómo funciona la red en tu sistema te permite:

- Ver tu IP (pública y privada)
- Diagnosticar problemas de conexión
- Detectar intrusos
- Analizar tráfico
- Preparar túneles, proxys, VPNs, etc.

### 1. 🌐 *Neon ya incluye lo esencial para conectividad*

- NetworkManager está integrado.
- El applet de red en Plasma te permite conectarte fácil a Wi-Fi o cableado.
- Pero **saber cómo diagnosticar desde terminal** es clave para cuando el GUI falla o no responde.

---

### 2. 🛠️ *Fortalecimiento de la caja de herramientas ninja*

Instalar:

```bash
sudo apt install net-tools nmap traceroute curl
```

Te da visores y escáneres clásicos que no vienen por defecto, pero que **todo entorno serio de red necesita**.

---

### 3. 🧭 *Verificación del entorno actual*

Con:

```bash
ip a
ping google.com
curl ifconfig.me

```

Ves:

- Tu IP interna
- Tu conexión a internet
- Tu presencia externa (IP pública)

Perfecto para saber si estás **en tu dojo, en territorio hostil, o detrás de un proxy corporativo**.

---

### 4. 🧠 *Prevención de fuga de datos por DNS*

Ver tus DNS con:

```bash
cat /etc/resolv.conf
```

Es una forma rápida de saber si tus consultas pasan por Google, por tu ISP o si ya estás protegido.

---

### 5. 🌪️ *Listo para fases futuras: Tor, VPN, escaneo, anonimato*

No vamos a instalar todo ahora, pero este paso deja la red **preparada para lo que venga**:

- Tails para anonimato total
- Kali para auditoría
- ProtonVPN o WireGuard
- Red local, túneles, sniffers, etc.