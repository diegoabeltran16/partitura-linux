## 📐 1. ¿Qué es Ed25519 y qué matemáticas lo respaldan?

**Ed25519** es una implementación específica del algoritmo de firmas **EdDSA (Edwards-curve Digital Signature Algorithm)**, usando la curva elíptica **Curve25519**.

---

### 🔢 ¿Qué es una curva elíptica?

Es una función matemática que define una forma como esta:

y2=x3+ax+b(curvasWeierstrassclaˊsicas)

Pero Ed25519 usa una **curva de Edwards**, que es más eficiente:

x2+y2=1+dx2y2

Donde `d` es una constante en el campo finito `𝔽_p` (de tamaño primo `p`).

---

### 📌 ¿Qué es Curve25519?

- Un tipo especial de curva de Edwards llamada **Twisted Edwards**
  
- Definida sobre el campo primo:
  
  p=2255−19
  
- Esta elección no es arbitraria:
  
  - ✅ Muy eficiente en cálculos mod `p`
    
  - ✅ Permite operaciones constantes (sin leaks por *timing attacks*)
    
  - ✅ No tiene “curvas débiles” como otras ECC propuestas por gobiernos
    

---

### 🧮 ¿Cómo funciona la firma EdDSA con Ed25519?

1. **Clave privada** `k`
  
2. Se deriva una **clave pública** `K = k · B`, donde `B` es un punto base de la curva
  
3. Para firmar un mensaje `m`:
  
  - Se genera una parte aleatoria `r` determinística basada en `k` y `m`
    
  - Se calcula `R = r · B`
    
  - Se computa el hash `h = H(R || K || m)`
    
  - La firma final es:
    
    (R,S=r+h⋅kmodl)
    
  
  Donde `l` es el orden del grupo
  
4. Para verificar: se revisa que:
  
  S⋅B=R+H(R∣∣K∣∣m)⋅K
  

🔍 Todo esto se hace con operaciones modulares sobre la curva, con funciones hash seguras.

---

## 🛡️ 2. ¿Por qué Ed25519 es más robusto que RSA o ECDSA?

| Propiedad | RSA/ECDSA | Ed25519 |
| --- | --- | --- |
| ⚡ Velocidad | Lento (multiplicaciones grandes) | Muy rápido (operaciones de curva optimizadas) |
| 🔒 Resistencia a timing attacks | ECDSA y RSA pueden filtrar bits | Ed25519 es **constant-time por diseño** |
| 📏 Tamaño de firma | RSA: 512+ bytes, ECDSA: ~70 bytes | Ed25519: **64 bytes exactos** |
| 📉 Tamaño de clave | RSA: hasta 4096 bits | Ed25519: solo 256 bits |
| 🧪 Determinismo de firmas | ECDSA usa `k` aleatorio (riesgo si se repite) | Ed25519 **genera firmas deterministas** |
| 🔐 Seguridad efectiva | RSA-3072 ≈ Ed25519 | Muy fuerte para 128-bit security |

🔍 En resumen: **más compacto, más rápido, más seguro en la práctica.**

---

## 🖥️ 3. Requisitos para correr tu `cifrar.sh` con Ed25519

### ✅ Software necesario

| Requisito | Cómo verificar o instalar |
| --- | --- |
| **GPG versión ≥ 2.2** | `gpg --version` → debe mostrar EdDSA |
| **Soporte para ECC** | Automático en GPG ≥ 2.1 |
| **Sistema Unix/Linux o WSL** | Ya lo tienes |

🔍 Si ves esto en la salida de `gpg --version`:

bash



`Pubkey: RSA, ELG, DSA, ECDH, ECDSA, EDDSA`

➡️ ¡Tu sistema soporta `ed25519`!

---

### 📦 Script `cifrar.sh` Ed25519: resumen rápido

- Usa `--sign --armor -c` con tu clave `Naveen-Ed25519`
  
- Firma con Ed25519
  
- Cifra con AES-256 (simétrico)
  
- Produce archivo `.asc` compatible con TiddlyWiki
  

⚙️ Requiere: tener creada e importada tu clave Ed25519 en GPG local  
🔒 No necesita que otros la tengan, salvo que quieran **verificar la firma**



# 🛠️ Crear una firma digital Ed25519 con GPG

### ✅ Objetivo:

- Crear una **clave GPG** basada en **Ed25519**
  
- Usarla para **firmar archivos** (no cifrarlos aún)
  
- Luego integrarla a tu sistema (scripts, TiddlyWiki, CI/CD, etc.)
  

---

## 🔹 Paso 1: Iniciar el proceso de creación

bash
`gpg --expert --full-generate-key`

Este comando abre el asistente interactivo de GPG.

---

## 🔹 Paso 2: Elegir el tipo de clave

Cuando veas esto:

sql

Please select what kind of key you want: 
(1) RSA and RSA (default) 
(2) DSA and Elgamal 
(3) DSA (sign only) 
(4) RSA (sign only) 
(9) ECC and ECC

➡️ Escribe:

`9`

(Esto significa "ECC and ECC", necesario para usar Ed25519)

---

## 🔹 Paso 3: Seleccionar la curva

Verás algo como:

bash

`Please select which elliptic curve you want: (1) Curve 25519 (2) NIST P-256 ...`

➡️ Elige:

`1`

Esto usa la curva **Curve25519**, que activará **Ed25519 para firmas**.

---

## 🔹 Paso 4: Configurar expiración

Cuando te pregunte:

vbnet

`Key is valid for? (0)`

Escribe por ejemplo:

`1y`

(Esto indica que tu firma será válida por 1 año. Siempre puedes renovarla o revocarla luego.)

Confirma con `y` cuando te pregunte si es correcto.

---

## 🔹 Paso 5: Introducir información de identificación

yaml

`Real name: Naveen-Ed25519 Email address: [puedes dejarlo en blanco] Comment: Firma personal Ed25519`

Presiona `O` (de OK) cuando confirme la identidad.

---

## 🔹 Paso 6: Crear passphrase segura

Se te pedirá una contraseña para proteger tu clave.  
✅ Usa una passphrase fuerte, pero que puedas recordar (o guarda en tu sistema cifrado).

---

## 🔎 Paso 7: Verifica que se creó correctamente

bash



`gpg --list-secret-keys --keyid-format=long`

Debes ver algo así:

java



`sec ed25519/ABCD1234EFGH5678 2025-05-01 [SC] Key fingerprint = 89A2 73B1 9F18 ... F3B7 9C1D uid [ultimate] Naveen-Ed25519 (Firma personal Ed25519)`

✅ Apunta el **Key ID largo** (`ABCD1234EFGH5678`) o los últimos 8 caracteres del **fingerprint** (`F3B79C1D`).

---

## 🧪 Paso 8: Probar tu firma en un archivo

Crea un archivo:

bash



`echo "Mensaje de prueba" > mensaje.txt`

Fírmalo con tu nueva clave:

bash



`gpg --sign --armor --local-user Naveen-Ed25519 mensaje.txt`

Esto genera un archivo llamado `mensaje.txt.asc`

✅ Puedes abrirlo con cualquier editor de texto: es legible, seguro y portable.

---

## ✅ ¡Listo!

Ahora puedes:

- Usar `"Naveen-Ed25519"` en tus scripts (`cifrar.sh`)
  
- Verificar firmas con tu fingerprint (`F3B79C1D`) en `descifrar-estricto.sh`
  
- Exportar tu clave pública para compartirla si alguien necesita validar tus firmas:
  

bash



`gpg --armor --export "Naveen-Ed25519" > naveen-ed25519.asc`