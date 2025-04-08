# 🔐 **GnuPG – El arte de cifrar, firmar y autenticar con propósito**

## 📌 ¿Qué es GnuPG?

**GnuPG** (GNU Privacy Guard) es la implementación libre del estándar **OpenPGP**, y uno de los sistemas más sólidos de **cifrado y firma digital** de archivos y comunicaciones.

Es el **sello de autenticidad**, la **caja fuerte invisible**, y el **apretón de manos silencioso** entre agentes digitales.

> 🧠 GPG no es solo para cifrar: es para demostrar que el mensaje vino de vos... y que no fue alterado por nadie más.
> 

---

## 🧩 ¿Para qué sirve?

| Función principal | ¿Qué permite hacer? |
| --- | --- |
| ✉️ Cifrar archivos o textos | Solo quien tiene tu clave puede leerlos |
| ✍️ Firmar digitalmente | Autenticar que vos los creaste |
| 🔐 Compartir claves públicas | Para que otros puedan cifrar archivos dirigidos a vos |
| 📁 Verificar integridad | Saber si un archivo fue modificado |

---

## 🛡️ ¿Por qué es importante?

- ✅ Te permite **proteger información sensible** (notas, scripts, configuraciones)
- ✅ Te permite **verificar la autenticidad de archivos** que descargás (como ISOs)
- ✅ Permite trabajar con **identidades digitales confiables**, sin depender de terceros

> En tiempos de vigilancia y suplantación, tener una identidad criptográfica propia es como tener un sello samurái: inconfundible.
> 

---

## 🛠️ ¿Cómo funciona?

GnuPG trabaja con un sistema de **clave pública y privada** (par de llaves):

- 🔑 **Clave privada**: solo vos la tenés. Sirve para **descifrar** y **firmar**.
- 🏹 **Clave pública**: la compartís. Otros la usan para **cifrar** cosas que solo vos podés abrir.

---

## 🧱 ¿Cómo usarlo?

### 🧰 Instalación

Ya viene en la mayoría de distribuciones, pero si no:

```bash
bash
CopyEdit
sudo apt install gnupg

```

---

### 🔧 1. Crear tu par de llaves

```bash
bash
CopyEdit
gpg --full-generate-key

```

- Elegí: RSA y RSA (por defecto)
- Tamaño recomendado: 4096 bits
- Fecha de expiración: opcional
- Nombre real: podés usar un seudónimo
- Email: opcional o también ficticio
- Passphrase: tu clave maestra

> 🧠 Tu identidad digital acaba de nacer. Tu espada tiene ahora una empuñadura única.
> 

---

### 📫 2. Exportar tu clave pública (para compartir)

```bash
bash
CopyEdit
gpg --armor --export tu_id_o_email

```

Esto genera algo así:

```
vbnet
CopyEdit
-----BEGIN PGP PUBLIC KEY BLOCK-----
...
-----END PGP PUBLIC KEY BLOCK-----

```

Podés enviarla, subirla a servidores de claves, o guardarla en un README.

---

### 🔒 3. Cifrar un archivo

```bash
bash
CopyEdit
gpg -e -r nombre_o_email archivo.txt

```

Esto crea `archivo.txt.gpg` cifrado, que solo el destinatario puede abrir.

---

### 🔓 4. Descifrar un archivo

```bash
bash
CopyEdit
gpg -d archivo.txt.gpg

```

Solo vos, con tu clave privada, podés leerlo.

---

### ✍️ 5. Firmar un archivo

```bash
bash
CopyEdit
gpg -s archivo.txt

```

Esto genera `archivo.txt.gpg` firmado. Sirve para verificar autoría.

También podés firmar sin cifrar:

```bash
bash
CopyEdit
gpg --clearsign archivo.txt

```

---

### ✅ 6. Verificar una firma

```bash
bash
CopyEdit
gpg --verify archivo.txt.asc

```

Si la firma es válida y coincide con la clave del autor, verás algo como:

```bash
bash
CopyEdit
Good signature from "Sensei Ninja <ninja@dojo.io>"

```

---

## 🧩 Casos de uso ninja

- Firmar commits en GitHub
- Proteger `.md` personales con comandos secretos
- Validar ISOs de distros (Kali, Tails, Debian…)
- Cifrar tu archivo de claves o contraseñas
- Crear mensajes cifrados en la terminal para otros ninjas

---

## 💡 Integraciones y GUI

- 🔑 **Kleopatra**: GUI para GPG en KDE
- 🔏 **Seahorse**: Para GNOME
- 🔐 **Thunderbird + Enigmail**: Para cifrar emails

---

## 🧘‍♂️ Conclusión del Sensei

> “Quien firma con su llave, no solo protege sus datos… protege su nombre.”
> 

GnuPG no es complicado. Es elegante.

Un arma antigua, de precisión quirúrgica.

Y una forma de decir: *“esto fui yo, y nadie más”*.

---
