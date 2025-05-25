## 🧠 ¿Qué es el **Principio de Mínimo Privilegio**?

> 🔐 **Definición**:  
> Un sistema, usuario o programa **solo debe tener los privilegios estrictamente necesarios para realizar su función**, **ni más ni menos**.

---

### 📦 Ejemplos simples:

| Caso | Mal diseño | Aplicando mínimo privilegio |
| --- | --- | --- |
| Un script de respaldo | Se ejecuta como root | Solo accede a `/home/usuario/Documentos` |
| Un usuario de oficina | Tiene acceso a `/etc` o a logs del sistema | Solo puede leer y guardar archivos en su escritorio |
| Un proceso de red | Escucha todos los puertos | Solo escucha en el puerto que necesita (ej. 443) |
| Reglas de UFW | Todo permitido por defecto | Solo se permiten puertos necesarios (ej. 22, 443) |

---

### 🎯 ¿Por qué es importante?

- Reduce la **superficie de ataque**: menos puertas abiertas = menos vectores vulnerables.
  
- Limita el **daño potencial si algo se ve comprometido** (por ejemplo, si un proceso es hackeado, no puede salir a otros directorios).
  
- Ayuda a cumplir con normativas de seguridad (como CIS Benchmarks, ISO/IEC 27001, etc.).
  
- Es **fácil de entender y aplicar en la vida diaria**, incluso sin conocimientos técnicos avanzados.