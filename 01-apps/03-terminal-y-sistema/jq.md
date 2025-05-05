**`jq`** es una **herramienta de línea de comandos** especializada en procesar y transformar datos en **formato JSON**. Piensa en él como en un “sed/awk” para JSON: permite extraer campos, filtrar arrays, reformatear estructuras y combinar datos, todo con una sintaxis declarativa muy concisa.

---

## Definición breve

- **Nombre:** `jq`
  
- **Función principal:** parseo, filtrado y transformación de JSON
  
- **Características clave:**
  
  - Lee JSON desde stdin o ficheros
    
  - Emite JSON (o texto plano) limpio como output
    
  - Permite encadenar filtros (`|`, `,`, `map`, `select`, etc.)
    
  - Soporta expresiones, variables y funciones integradas
    

---

## Otros usos comunes de `jq`

1. **Consultar APIs REST**
  
  bash
  
  CopyEdit
  
  `curl -s https://api.example.com/users | jq '.users[] | {id,name,email}'`
  
  Extraes sólo los campos que te interesan, descartando el resto.
  
2. **Validación y pretty-print**
  
  bash
  
  CopyEdit
  
  `jq . archivo.json`
  
  Reformatea el JSON con indentación legible; detecta errores de sintaxis.
  
3. **Transformación masiva de datos**
  
  bash
  
  CopyEdit
  
  `jq 'map(.price |= (. * 1.16))' productos.json`
  
  Aplica un aumento del 16 % a todos los precios de un array.
  
4. **Extracción de estadísticas o recuentos**
  
  bash
  
  CopyEdit
  
  `jq '[.logs[].level] | group_by(.) | map({level: .[0], count: length})' logs.json`
  
  Obtienes cuántos mensajes de cada nivel (“info”, “error”, …) hay en un log.
  
5. **Generación de configuraciones**
  
  bash
  
  CopyEdit
  
  `cat plantillas.json | jq --arg host "$HOST" '.database.host = $host'`
  
  Rellena valores dinámicamente antes de desplegar un servicio.
  
6. **Combinar múltiples fuentes JSON**
  
  bash
  
  CopyEdit
  
  `jq -s 'add | .items |= unique_by(.id)' f1.json f2.json`
  
  Suma dos arrays y elimina duplicados por `id`.
  
7. **Extracción de datos anidados**
  
  bash
  
  CopyEdit
  
  `jq -r '.users[] | .roles[]?' datos.json`
  
  Listas planas de elementos que estaban en varias capas de anidamiento.
  
8. **Pipeline en bash**
  
  bash
  
  CopyEdit
  
  `cat datos.json \ | jq '.items[]' \ | grep '"status":"active"' \ | jq '.name, .email'`
  
  Integración con comandos de texto estándar para flujos de trabajo complejos.
  
9. **Scripting reproducible**
  
  - Scripts de CI/CD para procesar artefactos JSON
    
  - Extracción automatizada de métricas de build, tests o cobertura
    
10. **Análisis de logs en JSON**  
  Muchas aplicaciones generan logs en JSON; con `jq` puedes filtrar, agrupar o extraer trazas sin cargar Kibana u otras herramientas.
  

---

En definitiva, `jq` es **el componente esencial** cuando trabajas con JSON en la terminal: hace tu workflow más ágil y tus scripts más robustos, sin tener que recurrir a lenguajes más pesados como Python o Node.js para tareas sencillas de manipulación de datos.