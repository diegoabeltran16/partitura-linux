## 🛠️ Rescatux: tu dojo de rescate para sistemas caídos

**Rescatux** es una distribución GNU/Linux live especializada en **reparación y recuperación** de sistemas, tanto Linux como Windows. Está construida sobre Debian y diseñada con herramientas gráficas que simplifican operaciones avanzadas.

> 🧙 "Cuando no queda más que una terminal… aún queda Rescatux."
> 

---

### 🧩 ¿Cuándo usar Rescatux?

- Cuando tu sistema no arranca por problemas con GRUB o MBR
- Si olvidaste tu contraseña de root o administrador
- Si el sistema de archivos quedó inconsistente o dañado
- Cuando querés reparar particiones Windows sin bootearlo
- Si querés reinstalar GRUB sin complicarte con chroot

---

## 🧰 Funciones principales

| Herramienta | Uso |
| --- | --- |
| **Restore GRUB** (2 o legacy) | Restaura el gestor de arranque en distros Linux |
| **Restore Windows Boot** | Repara el arranque de Windows (MBR) |
| **Password Reset** | Borra o cambia contraseñas de usuarios Linux o Windows |
| **Fix Linux Filesystem** | Monta y verifica particiones Linux |
| **GParted** | Gestiona particiones (viene preinstalado) |
| **TestDisk** | Recupera particiones perdidas o eliminadas |
| **Photorec** | Recupera archivos borrados |
| **Chntpw** | Elimina contraseñas en sistemas NT (Windows) |

---

## 🧭 Flujo típico de uso (ejemplo: sistema no arranca)

1. Bootear desde el USB con Rescatux
2. Elegir idioma y cargar el entorno gráfico
3. Abrir el **Rescapp**, la herramienta central
4. Seleccionar:
    - **Restore GRUB** si no se ve ningún sistema
    - **Fix Linux Filesystem** si creés que hay errores de disco
5. Confirmar operaciones y reiniciar

> 🧠 Muchas tareas avanzadas que requieren comandos, en Rescatux están automatizadas y guiadas.
> 

---

## 🔐 Herramientas éticas y peligrosas

Algunas opciones, como cambiar contraseñas o eliminar claves, son poderosas. Son útiles para recuperar sistemas legítimos, **pero deben usarse con responsabilidad**.

> 🕶️ Un ninja sabio no abusa de su habilidad para entrar por puertas olvidadas.
> 

---

## 💡 Casos de uso estratégicos

| Escenario | Herramienta Rescatux |
| --- | --- |
| GRUB borrado tras instalar Windows | Restore GRUB |
| No recordás tu contraseña de root | Password Reset |
| Partición de Linux no se monta | Fix Filesystem |
| Windows no arranca tras update | Restore Windows Boot |
| Necesitás copiar archivos desde un sistema que no arranca | File Manager + USB externo |
| Recobrar una partición entera eliminada | TestDisk |

---

## 🌱 Recomendaciones

- Siempre montar en modo **solo lectura** al principio, si querés analizar sin alterar.
- Usar **GParted** para ver la tabla de particiones antes de hacer cambios.
- Si no sabés qué hacer, primero probá con **Restore GRUB** y observá si el sistema vuelve a cargar.

---

## 🧙‍♂️ ¿Qué puede hacer en un computador desconocido?

Si tenés acceso físico a un equipo y podés **bootear desde USB o CD**, Rescatux te permite:

### 🔓 **1. Quitar o cambiar contraseñas**

- ✅ En sistemas **Linux**: cambiar o borrar la contraseña de cualquier usuario, incluso *root*
- ✅ En sistemas **Windows**: resetear contraseñas de administrador (usando *chntpw*)

> 🎯 Esto te da acceso completo al sistema, sin necesidad de reinstalar
> 

---

### 🛠 **2. Reparar GRUB o MBR**

- Si el sistema fue mal instalado o eliminado, y ya no carga ningún SO
- Restaura el gestor de arranque de Linux (GRUB) o Windows (MBR/BCD)

> Esto recupera el arranque sin perder información del disco
> 

---

### 🧹 **3. Preparar para nueva instalación**

- Podés borrar particiones, redimensionar, y dejar espacio libre con GParted
- Incluso podés montar el disco y **hacer backup antes de instalar algo nuevo**

> Así no se pierde info innecesariamente, ni se pisa nada sin pensar
> 

---

### 💾 **4. Recuperar datos o particiones**

- Con **TestDisk** podés revivir particiones borradas o dañadas
- Con **PhotoRec** podés rescatar archivos eliminados (fotos, docs, etc.)

---

### 🧠 Entonces... ¿Rescatux “formatea”?

**No, salvo que vos lo hagas.**

Te da poder para:

- Acceder a discos aunque estén rotos o protegidos
- Eliminar bloqueos por contraseña
- Preparar el equipo para una nueva vida con un Linux limpio (como KDE neon 😎)

---

## ⚠️ Importante

> Si bien técnicamente podés "tomar control" de un equipo, el uso debe ser ético.
> 
> 
> Solo hacerlo en computadoras tuyas, de tu organización o con consentimiento.
> 

---

## 🛡 Ideal para:

- Reciclar laptops viejas (¡o bloqueadas!)
- Ayudar a personas mayores que olvidaron su contraseña
- Recuperar PCs que solo muestran pantallas negras
- Hacer auditoría o diagnóstico en campo sin dejar rastros

---

## 🧘‍♂️ Cirugía de emergencia: devolverle la respiración a un sistema caído

> “Donde los demás ven una máquina inútil... un ninja ve una misión.”
> 

**Rescatux** es una herramienta pensada para *revivir, liberar y reconfigurar* sistemas operativos bloqueados, rotos o abandonados.

No elimina datos innecesariamente.

No impone reinstalaciones forzadas.

Simplemente **devuelve el control** al usuario.

---

### 🛠 ¿Qué podés hacer con Rescatux?

### 🔓 Recuperar el acceso

```
text
CopyEdit
✔ Resetear contraseñas de root en Linux
✔ Borrar contraseñas de Windows
✔ Activar cuentas bloqueadas o desactivadas

```

> Ideal para recuperar equipos olvidados, donar computadoras, o ayudar a otros.
> 

### ⚙️ Reparar el arranque

```
text
CopyEdit
✔ Restaurar GRUB dañado tras un mal dual boot
✔ Reconstruir el MBR si el sistema no inicia
✔ Detectar y arreglar particiones corruptas

```

### 💾 Rescatar y preparar

```
text
CopyEdit
✔ Acceder a discos incluso si no montan normalmente
✔ Hacer backup antes de formatear
✔ Borrar, redimensionar o crear particiones con GParted

```

### 🕵️‍♂️ Análisis forense (mínimo pero útil)

```
text
CopyEdit
✔ Montar discos para inspección
✔ Recuperar archivos eliminados (con herramientas como TestDisk o PhotoRec)
✔ Examinar logs desde una sesión externa

```

---

### 🧠 ¿Es peligroso usar Rescatux?

No si sabés lo que hacés.

Es una **navaja suiza**, no un martillo.

Te da control total — pero cada acción debe ser **consciente**.

> 🥷 Un ninja solo rompe lo necesario... para reconstruir mejor.
> 

---

### 🧱 Casos comunes de uso

| Situación | Solución |
| --- | --- |
| “Olvidé la contraseña de Linux” | Reset con un clic |
| “Windows no inicia tras instalar Linux” | Reparar GRUB/MBR |
| “La laptop quedó negra tras un apagón” | Inspección desde entorno Live |
| “Quiero formatear sin perder fotos” | Backup con GParted o terminal |
| “Voy a donar un equipo y quiero dejarlo limpio” | Reset + wipe + preparar para instalar |

---

## 🔐 Ética del rescate

Este tipo de herramientas pueden ser mal usadas.

**Nunca las emplees sin consentimiento.**

El poder técnico sin responsabilidad es solo otro tipo de violencia digital.

> “Restaurar un sistema no es un acto técnico, es un acto de respeto: al equipo, al usuario y a la libertad.”
> 

---

## 🧠 Conclusión

**Rescatux no es para el uso diario.**

Es para esos momentos donde **los comandos fallan, la pantalla se queda negra**, o un disco muestra silencio en vez de arranque.

> Donde el sistema calla, Rescatux puede hablar.
> 

---

