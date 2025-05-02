#!/bin/bash

echo "📦 Aplicaciones Flatpak instaladas:"
flatpak list

echo "🔄 Actualizando todas las aplicaciones Flatpak..."
flatpak update -y

echo "✅ Actualización completada."
