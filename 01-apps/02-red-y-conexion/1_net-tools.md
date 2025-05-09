# 🧰 `net-tools` — El arsenal clásico del ninja de redes

## 📌 ¿Qué es `net-tools`?

**`net-tools`** es un paquete que contiene **herramientas de red clásicas** en GNU/Linux. Aunque muchas han sido reemplazadas por utilidades modernas (`ip`, `ss`, etc.), **siguen siendo esenciales en auditorías, entornos legacy y scripts rápidos**.

Incluye comandos como:

- `ifconfig`
- `netstat`
- `route`
- `nameif`
- `arp`

> 🧠 Aunque algunas de estas herramientas ya no están activamente mantenidas, saber usarlas es como conocer el kanji antiguo: abre puertas que otros ya no saben ver.
> 

---

## 🛠️ ¿Cómo instalarlo?

```bash
sudo apt install net-tools

```

🔹 Viene desactivado por defecto en muchas distros modernas.

---

## 🧩 Herramientas incluidas y sus usos

### 1. `ifconfig` – Ver interfaces de red

```bash
ifconfig
```

🔍 Muestra:

- Interfaces activas (`eth0`, `wlan0`, `lo`)
- Dirección IP, máscara, estado
- Estadísticas de paquetes

> 🥷 Ideal para diagnósticos rápidos sin depender de ip a.
> 

---

### 2. `netstat` – Ver conexiones activas y puertos

```bash
netstat -tuln
```

🔍 Útil para:

- Ver servicios que están escuchando en puertos (HTTP, SSH, etc.)
- Detectar conexiones sospechosas
- Diagnóstico de red local

> 🔐 Es una forma de ver si el castillo tiene puertas abiertas… y quién las está cruzando.
> 

---

### 3. `route` – Ver tabla de enrutamiento

```bash
route -n
```

🔍 Muestra cómo se enrutan los paquetes hacia otras redes o internet.

> 🛣️ Útil para ver si estás detrás de un gateway o proxy.
> 

---

### 4. `arp` – Ver tabla ARP (vecinos de red)

```bash
arp -a
```

🔍 Lista dispositivos conectados recientemente en tu red local, con IP y MAC.

> 👣 Te ayuda a detectar presencia en la red… incluso si ya se fueron.
> 

---

### 5. `nameif` – Renombrar interfaces de red

```bash
nameif eth0 ninja0
```

🔧 Rara vez usado hoy, pero útil para scripts avanzados o configuraciones estáticas.

---

## 📚 Comparación con herramientas modernas

| Función | `net-tools` | Comando moderno |
| --- | --- | --- |
| Ver interfaces | `ifconfig` | `ip a` |
| Ver conexiones | `netstat` | `ss` |
| Tabla de rutas | `route` | `ip route` |
| Tabla ARP | `arp` | `ip neigh` |

> 🔁 Aprender ambos te permite moverte en sistemas nuevos y antiguos.
> 
> 
> Como un ninja que domina tanto el sable moderno… como la katana ancestral.
> 

---

## 🧪 Casos de uso típicos

| Escenario | Comando |
| --- | --- |
| Ver IP local en red antigua | `ifconfig` |
| Diagnóstico de red sin GUI | `netstat -tuln` |
| Saber si algo está escuchando el puerto 22 | `netstat -an |
| Ver con quién habla tu sistema | `netstat -pant` |
| Detección de presencia en red LAN | `arp -a` |

---

## 🧘‍♂️ Reflexión del Sensei

> “En un mundo de interfaces gráficas, el verdadero guerrero mira al alma de la red... y allí encuentra net-tools.”
> 

> Aunque modernas herramientas brillen más, las clásicas aún tienen filo.
>
