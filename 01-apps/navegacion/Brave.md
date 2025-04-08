# 🦁 **Brave – Navegador centrado en privacidad y velocidad**

## 📌 ¿Qué es Brave?

**Brave** es un navegador web de código abierto construido sobre **Chromium**, con un enfoque radical en la **privacidad del usuario, velocidad y bloqueos automáticos de rastreadores**.

Pero no es solo “otro navegador” —es una declaración táctica.

Elimina lo innecesario, protege lo sensible, y lo hace todo... sin que tengas que configurar nada extra.

> 🔒 Bloquea rastreadores, anuncios y scripts invasivos por defecto.
> 

> ⚡ Carga páginas más rápido al eliminar basura visual y tecnológica.
> 

---

## 🧩 ¿Para qué sirve?

| Función | Resultado |
| --- | --- |
| 🚫 Bloqueo de rastreadores | Privacidad real sin extensiones |
| 🧪 Protección contra fingerprinting | Más difícil de identificar tu máquina |
| ⛔ Ad-block integrado | No necesitas instalar uBlock ni similares |
| 🧠 Motor Chromium | Compatible con casi todos los sitios |
| 🌐 Tor integrado (modo privado) | Navegación anónima sin necesidad de abrir otro navegador |
| 📈 Panel de privacidad | Visualiza qué se bloqueó y cómo |

---

## 💡 ¿Por qué elegir Brave en un entorno como KDE Neon?

- ✅ *Privacidad desde el inicio* (sin instalar extensiones extra)
- ✅ Menor uso de CPU y RAM que Chrome
- ✅ Ideal para sesiones normales o ligeras sin requerir Tails o VPN
- ✅ Soporte para sincronización (opcional y sin cuenta)
- ✅ **Modo Tor** integrado para acceso privado temporal

> "Si Firefox es sigilo... Brave es armadura rápida."
> 

---

## ⚙️ ¿Cómo funciona el Modo Tor de Brave?

Al abrir una ventana privada con Tor (`Ctrl+Shift+N`), Brave:

- Se conecta a la red **Tor** automáticamente
- No usa extensiones, cookies, DNS locales ni historial
- Cambia tu IP en cada sesión
- **Importante:** *No reemplaza Tails, pero es útil para situaciones rápidas de navegación anónima*

> 🧠 Perfecto para consultas temporales sin montar sistemas enteros.
> 

---

## 🔧 ¿Qué puedo ajustar o personalizar?

- Cambiar motor de búsqueda por **DuckDuckGo**, **Startpage** o **Brave Search**
- Activar “HTTPS Everywhere” permanente
- Ajustar niveles de bloqueo (estándar, agresivo)
- Crear perfiles separados (ideal si alternás entre Naveen y vida cotidiana)

---

## 🧰 Instalación

```bash
bash
CopyEdit
sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave.com/static-assets/keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update && sudo apt install brave-browser

```

O podés descargarlo desde:

🌐 https://brave.com/linux/

---

## 🌉 Integraciones recomendadas

- Usalo con **Tailscale** o **ProtonVPN** para navegación segura por VPN
- Perfecto como navegador predeterminado en **entornos de Live USB con persistencia**
- Compatible con extensiones de Chrome (pero usá pocas, para mantener el sigilo ninja)

---

## 🧘‍♂️ Reflexión del Sensei

> “Brave no es invisible, pero sí invisible a los ojos que no saben mirar.”
> 

> Es rápido, discreto y sin ruido. Ideal para cuando necesitás velocidad sin sacrificar control.
> 

Una herramienta ideal cuando **Tails no es necesario, pero Firefox es demasiado expuesto.**
