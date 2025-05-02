# 🐉 Kali Linux Live (sin persistencia)

Kali Linux es una distribución basada en Debian, especializada en auditoría de seguridad, análisis forense y pruebas de penetración. Esta guía se enfoca en su uso desde un entorno Live USB sin persistencia: ideal para sesiones temporales, intervenciones rápidas y entrenamiento en campo.

---

## 🎯 Objetivo del documento

- Instalar Kali Live en una unidad USB multiboot
- Comprender su uso sin dejar rastro (modo live sin persistencia)
- Conocer las principales herramientas preinstaladas
- Aplicarlo en contextos éticos, formativos o de simulación técnica

---

## 📥 Descarga y verificación

1. Ir a la página oficial: [https://www.kali.org/get-kali/#kali-live](https://www.kali.org/get-kali/#kali-live)
2. Descargar la imagen `.iso` Live (no la installer)
3. Verificar integridad:
   ```bash
   sha256sum kali-linux-202X.X-live-amd64.iso
   # Comparar con hash oficial
   ```

---

## 🚀 Instalación en USB con Ventoy

1. Copiar la ISO verificada al directorio correspondiente de tu USB con Ventoy:

   ```bash
   /media/usuario/Ventoy/auditoria/kali-linux-202X.X-live-amd64.iso
   ```

2. Al bootear con Ventoy, seleccionar "Kali Live" en el menú.

3. Elegir la opción "Live (amd64)" o "Live (forensic mode)" si se desea montar los discos en solo lectura.

---

## 🛠️ Herramientas preinstaladas destacadas

Kali viene con cientos de herramientas agrupadas en menús temáticos. Algunas de las más conocidas:

| Herramienta       | Propósito                                      | Historia breve |
|-------------------|-----------------------------------------------|----------------|
| **Nmap**          | Escaneo de redes y detección de servicios     | Desde 1997, clásico en auditorías |
| **Wireshark**     | Sniffer de red, análisis de tráfico           | GUI para captura de paquetes, usado en forense y redes |
| **Burp Suite**    | Testing de seguridad en aplicaciones web      | Muy usado en pentesting web profesional |
| **Metasploit**    | Framework de explotación de vulnerabilidades  | Famoso por automatizar pruebas de exploits |
| **Aircrack-ng**   | Auditoría de redes Wi-Fi                      | Permite romper claves WEP/WPA (uso ético legal!) |
| **John the Ripper** | Cracking de contraseñas (hashes locales)    | Herramienta avanzada de fuerza bruta |
| **Hydra**         | Ataques de fuerza bruta a servicios remotos   | Combinación de diccionario + protocolos (ssh, ftp...) |
| **Nikto**         | Escaneo de vulnerabilidades en servidores web | Muy útil para detección rápida de fallos comunes |
| **Sqlmap**        | Automatiza inyecciones SQL                    | Detecta y explota fallas de bases de datos |
| **Netcat**        | Herramienta multipropósito de red             | Sencilla y poderosa para tunneling, escucha, conexiones manuales |

Estas herramientas fueron diseñadas para pruebas controladas, auditorías de seguridad autorizadas, formación técnica y simulación de ciberataques éticos.

> ☠️ *El uso no autorizado de estas herramientas está penado por ley. Usalas siempre con consentimiento explícito del entorno objetivo.*

---

## 🔐 Modo sin persistencia

- No se guarda ningún cambio al reiniciar
- Ideal para evitar trazabilidad local
- Recomendado para navegar, investigar o auditar sin dejar huellas

> *En el modo Live, cada sesión es una hoja en blanco.*

---

## 🧠 Recomendaciones operativas

- Usar modo forense si no querés que los discos locales se monten automáticamente
- Desconectar redes cuando se manipulen herramientas ofensivas (seguridad)
- Tener siempre presente el objetivo: aprendizaje, protección y ética digital

---

## 📚 Recursos útiles

- Manual de Kali: [https://docs.kali.org](https://docs.kali.org)
- Guía de herramientas: [https://tools.kali.org](https://tools.kali.org)
- Curso gratuito: [https://kali.training](https://kali.training)

---

> 🧘‍♂️ *Un pentester ético conoce las herramientas... pero también sus consecuencias.*
