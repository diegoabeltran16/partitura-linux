# 🕵️ **Tor Browser – Navegación anónima a través de la red de cebolla**

## 📌 ¿Qué es Tor?

**Tor (The Onion Router)** es una red descentralizada diseñada para proporcionar **anonimato y privacidad** en la navegación.

El **Tor Browser** es su herramienta principal: un navegador modificado basado en Firefox que enruta el tráfico a través de **múltiples nodos cifrados**.

> 🌐 Navegar con Tor no es simplemente ocultar tu IP. Es entrar en una dimensión donde cada movimiento deja eco solo si vos lo permitís.
> 

---

## 🧩 ¿Para qué sirve?

| Función | Resultado |
| --- | --- |
| 🕸️ Ocultar IP y ubicación | Tu IP se cambia por una de la red Tor |
| 🔐 Cifrado de extremo a extremo (dentro de la red) | Nadie entre tú y la red Tor ve lo que hacés |
| 🌪️ Eludir censura | Acceso a contenido restringido geográficamente |
| 🕵️ Acceder a .onion | Sitios exclusivos de la red Tor (Deep/Dark web) |
| 🚫 Protección contra rastreo | Bloquea scripts, fingerprinting y cookies |

---

## ⚔️ ¿Qué lo diferencia de Brave?

| Característica | Brave con Tor | Tor Browser |
| --- | --- | --- |
| Red Tor | Parcial | Completa (multi-nodo) |
| Aislamiento de navegación | Medio | Muy alto (por pestaña, circuito, sesión) |
| Seguridad | Alta | Máxima |
| Censura y Deep Web | No accesible completamente | Totalmente accesible |

> 🧠 Brave con Tor es un escudo rápido. Tor Browser es camuflaje total.
> 

---

## 🧱 ¿Cómo funciona Tor?

1. Tu tráfico se cifra y se enruta a través de al menos **tres nodos aleatorios**: entrada, relevo y salida.
2. Cada nodo **solo conoce el anterior y el siguiente**. Nunca toda la ruta.
3. La IP de salida nunca es la tuya.

Este proceso simula las **capas de una cebolla**, de ahí su nombre.

> 🧅 “Quien te ve desde fuera, ve solo la última capa. Nunca la raíz.”
> 

---

## 🚧 Limitaciones y advertencias

- 📉 Tor es más **lento** que otros navegadores (por su enrutamiento múltiple).
- ❌ No está hecho para descargas masivas o streaming.
- ❌ Si usás cuentas personales (Google, etc.), **rompés el anonimato**.
- ⚠️ JavaScript puede ser un vector de filtración → Mantenelo **limitado o desactivado**.

---

## 🔧 Instalación

### Opción rápida:

1. Ir a https://www.torproject.org/
2. Descargar la versión para Linux
3. Extraer la carpeta y ejecutar:

```bash
bash
CopyEdit
./start-tor-browser.desktop

```

### O desde terminal (menos recomendado para newbies):

```bash
bash
CopyEdit
sudo apt install torbrowser-launcher
torbrowser-launcher

```

---

## 🌐 ¿Y qué son los `.onion`?

Son sitios accesibles **solo a través de la red Tor**. Suelen terminar en `.onion` y están alojados de forma descentralizada.

Ejemplos legítimos:

- ⚖️ ProPublica (.onion)
- 📚 [Bibliotecas libres como Z-Library (cuando está disponible)]
- 🗳️ Sitios de denuncia y periodismo seguro

---

## 🔐 Integraciones y combinaciones ninja

- Usalo desde **Tails** para anonimato completo
- Nunca lo mezcles con cuentas personales
- No lo uses en **máquinas corporativas** o bajo políticas de red estrictas

---

## 🧘‍♂️ Reflexión del Sensei

> “Donde hay ruido, uno desaparece en la multitud. Pero donde hay silencio... uno necesita un bosque de cebollas.”
> 

Tor no es para todo. No es rápido. No es cómodo.

Pero cuando lo que está en juego es **privacidad, seguridad o libertad**,

es una de las **últimas puertas honestas** que quedan abiertas en la red.

---
