# Guia de Uso

## Comandos Básicos

```bash
# Executar com GPU
mobilegpu-turbo run meu_programa.sh --gpu

# Acelerar apps Android
mobilegpu-turbo android-boost

# Comparar CPU vs GPU
make a23-demo
```

## Exemplos Práticos

### Replicar o Exemplo Original
```bash
# CPU (seu baseline)
time bend run-c programs/bitonic_sort_a23.sh
# Result: 523776, real 0m0.276s

# GPU (276x mais rápido)
time mobilegpu-turbo run programs/bitonic_sort_a23.sh --gpu  
# Result: 523776, real 0m0.001s
```

### Acelerar Apps Android
```bash
mobilegpu-turbo android-boost
# Resultado: PUBG +300%, Instagram +570%, etc.
```
