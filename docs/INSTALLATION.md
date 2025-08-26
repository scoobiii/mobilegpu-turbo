# Guia de Instalação

## Instalação Rápida (Recomendada)

```bash
curl -sSL https://raw.githubusercontent.com/mobilegpu-turbo/mobilegpu-turbo/main/install.sh | bash
```

## Build Manual

1. Clone o repositório:
```bash
git clone https://github.com/mobilegpu-turbo/mobilegpu-turbo.git
cd mobilegpu-turbo
```

2. Configure o ambiente:
```bash
make setup
```

3. Compile:
```bash
make build-user
```

4. Teste:
```bash
make test
./target/release/mobilegpu-turbo run examples/bitonic_sort_a23.sh --gpu
```

5. Instale:
```bash
make install
```

## Troubleshooting

- **GPU não detectada**: Verifique se Vulkan está instalado
- **Erro de compilação**: Execute `make setup` novamente
- **Permission denied**: Execute `chmod +x install.sh`
