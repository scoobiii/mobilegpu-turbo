#!/bin/bash
set -e
echo "🚀 Instalando MobileGPU-Turbo..."

# Detectar sistema e instalar
if [ -d "/data/data/com.termux" ]; then
    pkg update && pkg install -y rust git vulkan-tools
elif command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y build-essential git vulkan-utils
fi

# Baixar e instalar
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "📥 Baixando..."
git clone https://github.com/mobilegpu-turbo/mobilegpu-turbo.git
cd mobilegpu-turbo

echo "🔨 Compilando..."
make setup
make build-user

echo "📦 Instalando..."
make install

echo "✅ Instalação concluída!"
echo "Execute: mobilegpu-turbo --help"
