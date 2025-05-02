#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Este script debe ejecutarse como root (sudo)"
  exit 1
fi

echo "🔁 Actualizando paquetes relacionados con privacidad..."
apt update
apt install --only-upgrade -y gnupg pinentry-gtk2 veracrypt tor curl wget

echo "✅ Herramientas actualizadas."
exit 0
