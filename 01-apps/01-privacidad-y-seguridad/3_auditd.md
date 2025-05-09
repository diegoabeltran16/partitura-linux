# 🔍 ¿Qué es `auditd`?

`auditd` es el **demonio del sistema de auditoría** de Linux. Forma parte del **Linux Auditing System**, que permite registrar eventos relacionados con la seguridad del sistema, como accesos a archivos, ejecuciones de comandos, cambios de permisos, entre otros.

Es útil sobre todo en **entornos donde se requiere trazabilidad y cumplimiento** de normas de seguridad, como PCI-DSS, HIPAA, o ISO 27001.

---

## 📦 Características principales

- **Monitorea eventos de seguridad:** registros de quién hizo qué, cuándo y desde dónde.
  
- **Configuración detallada:** puedes elegir qué archivos, comandos o acciones auditar.
  
- **Logs detallados:** escribe en `/var/log/audit/audit.log`.
  
- **Integración con `ausearch`, `auditctl`, `aureport`:** herramientas para consultar, configurar o resumir los logs.
  

---

## 🧠 ¿Cómo funciona?

1. **`auditd`**: el demonio principal que se ejecuta en segundo plano, recoge y escribe los logs.
  
2. **`audit.rules`**: archivo donde defines las reglas de auditoría (qué vigilar).
  
3. **`auditctl`**: comando para configurar reglas de auditoría dinámicamente.
  
4. **`ausearch` / `aureport`**: herramientas para buscar eventos o generar reportes.
  

---

## 🛠️ Ejemplo de uso

Supón que quieres monitorear accesos al archivo `/etc/passwd`:

```bash
sudo auditctl -w /etc/passwd -p rwxa -k passwd-watch
```

Esto audita lecturas, escrituras, ejecuciones y cambios de atributos sobre el archivo. Luego puedes buscar eventos con:

```bash
sudo ausearch -k passwd-watch
```

---

## 🚨 ¿Por qué es importante?

- Ayuda a **detectar accesos no autorizados**.
  
- Proporciona evidencia para **análisis forense**.
  
- Es una capa más para el **endurecimiento de seguridad del sistema**.