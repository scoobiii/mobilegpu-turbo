#!/bin/bash
set -e

echo "🔧 Configurando MobileGPU-Turbo..."

# Detectar sistema
if [ -d "/data/data/com.termux" ]; then
    echo "📱 Sistema: Termux"
    pkg update && pkg install -y rust clang cmake git vulkan-tools
elif command -v apt &> /dev/null; then
    echo "🐧 Sistema: Ubuntu/Debian"
    sudo apt update
    sudo apt install -y build-essential cmake git vulkan-utils mesa-vulkan-drivers
fi

# Instalar Rust se necessário
if ! command -v cargo &> /dev/null; then
    echo "🦀 Instalando Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source ~/.cargo/env
fi

# Instalar Bend se necessário
if ! command -v bend &> /dev/null; then
    echo "🌀 Instalando Bend Language..."
    cargo install bend-lang
fi

echo "✅ Setup concluído!"
