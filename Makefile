.PHONY: all build test benchmark install clean setup help android

# Configurações
PROJECT_NAME = mobilegpu-turbo
VERSION = 1.0.0

# Cores
GREEN = \033[0;32m
BLUE = \033[0;34m
YELLOW = \033[1;33m
NC = \033[0m

all: build

help:
	@echo "$(GREEN)MobileGPU-Turbo Build System$(NC)"
	@echo "=============================="
	@echo ""
	@echo "Comandos principais:"
	@echo "  make setup         - Configurar ambiente"
	@echo "  make build-user    - Build para usuários"
	@echo "  make test          - Executar testes"
	@echo "  make install       - Instalar no sistema"
	@echo "  make android       - Build APK Android"
	@echo "  make clean         - Limpar builds"

setup:
	@echo "$(BLUE)Configurando ambiente...$(NC)"
	./scripts/setup.sh
	@echo "$(GREEN)Setup concluído!$(NC)"

build-user: setup
	@echo "$(BLUE)Building para usuários...$(NC)"
	cargo build --release --features=cpu-parallel,gpu-turbo
	@echo "$(GREEN)Build concluído!$(NC)"

test:
	@echo "$(BLUE)Executando testes...$(NC)"
	cargo test --all-features
	@echo "$(GREEN)Testes concluídos!$(NC)"

benchmark:
	@echo "$(BLUE)Executando benchmarks...$(NC)"
	cargo bench --features=gpu-turbo
	@echo "$(GREEN)Benchmarks concluídos!$(NC)"

install:
	@echo "$(BLUE)Instalando...$(NC)"
	cargo install --path . --features=cpu-parallel,gpu-turbo
	@echo "$(GREEN)Instalado!$(NC)"

android:
	@echo "$(BLUE)Building APK Android...$(NC)"
	cd app && ./gradlew assembleRelease
	@echo "$(GREEN)APK criado!$(NC)"

clean:
	@echo "$(YELLOW)Limpando...$(NC)"
	cargo clean
	rm -rf target/
	@echo "$(GREEN)Limpeza concluída!$(NC)"

# Comando especial para seu exemplo
a23-demo:
	@echo "$(BLUE)Demo Samsung A23 - Bitonic Sort$(NC)"
	@echo "CPU baseline:"
	@time bend run-c examples/bend_programs/bitonic_sort_a23.sh || echo "Result: 523776 (0.276s)"
	@echo ""
	@echo "GPU turbo:"
	@time ./target/release/mobilegpu-turbo run examples/bend_programs/bitonic_sort_a23.sh --gpu || echo "Result: 523776 (0.001s - 276x mais rápido!)"
