.PHONY: help install env ssl setup-hosts sail-up sail-up-local sail-down build-sail build-sail-local app-shell migrate seed fresh-seed serve test test-coverage generate-git-log generate-full-git-log generate-project-structure setup format

# Colors
GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
BLUE = \033[0;34m
BOLD = \033[1m
NC = \033[0m # No Color

# Help command
help: ## Show this help
	@echo "${YELLOW}${BOLD}Available commands:${NC}"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "${GREEN}make %-20s${NC} %s\n", $$1, $$2}'

install: ## Install dependencies with Composer
	@echo "${YELLOW}Installing dependencies...${NC}"
	composer install
	@echo "${GREEN}Dependencies installed successfully!${NC}"

env: ## Create .env file from .env.example
	@echo "${YELLOW}Creating .env file...${NC}"
	@if [ ! -f .env ]; then \
		cp .env.example .env; \
		echo "${GREEN}.env file created successfully!${NC}"; \
	else \
		echo "${BLUE}Using existing .env file.${NC}"; \
	fi

ssl: ## Generate SSL certificates
	@echo "${YELLOW}Generating SSL certificates...${NC}"
	@sh tools/programs/generate-ssl-certificate.sh
	@echo "${GREEN}SSL certificates generated successfully!${NC}"

setup-hosts: ## Setup custom domain in /etc/hosts file
	@echo "${YELLOW}Setting up hosts file...${NC}"
	@echo "This requires sudo access to modify /etc/hosts"
	@if grep -q "<host>" /etc/hosts; then \
		echo "${BLUE}Host entries already exist.${NC}"; \
	else \
		sudo bash -c 'echo "127.0.0.1 api.fichespedagogiques.com" >> /etc/hosts && \
		echo "127.0.0.1 www.<host>" >> /etc/hosts && \
		echo "::1 <host>" >> /etc/hosts && \
		echo "::1 www.<host>" >> /etc/hosts'; \
		echo "${GREEN}Hosts file updated successfully!${NC}"; \
	fi

sail-up: ## Start Laravel Sail with SSL and watch mode
	@echo "${YELLOW}Starting Laravel Sail...${NC}"
	./vendor/bin/sail up -d
	@echo "${GREEN}Laravel Sail started successfully!${NC}"

sail-up-local: ## Start Laravel Sail with local environment
	@echo "${YELLOW}Starting Laravel Sail with local environment...${NC}"
	@if [ -f .env.local ]; then \
		docker-compose --env-file .env.local -f docker-compose.local.yml up --build --watch; \
		echo "${GREEN}Laravel Sail started successfully!${NC}"; \
	else \
		echo "${RED}Error: .env.local file not found!${NC}"; \
		exit 1; \
	fi

sail-down: ## Stop Laravel Sail
	@echo "${YELLOW}Stopping Laravel Sail...${NC}"
	./vendor/bin/sail down
	@echo "${GREEN}Laravel Sail stopped successfully!${NC}"

build: ssl ## Docker build
	@echo "${YELLOW}Building Docker image...${NC}"
	@if [ -f .env ]; then \
				docker build --no-cache -t app .; \
				echo "${GREEN}Docker image built successfully!${NC}"; \
		else \
				echo "${RED}Error: Setup not completed!${NC}"; \
				echo "${YELLOW}Run 'make setup' to complete the setup.${NC}"; \
				exit 1; \
		fi

build-cache: ssl ## Docker build with cache
	@echo "${YELLOW}Building Docker image...${NC}"
	@if [ -f .env ]; then \
				docker build -t app .; \
				echo "${GREEN}Docker image built successfully!${NC}"; \
		else \
				echo "${RED}Error: Setup not completed!${NC}"; \
				echo "${YELLOW}Run 'make setup' to complete the setup.${NC}"; \
				exit 1; \
		fi

build-local: ssl ## Docker build with local environment
	@echo "${YELLOW}Building Docker image with local environment...${NC}"
	@if [ -f .env.local ]; then \
	docker build --no-cache -t app -f local.Dockerfile .; \
		echo "${GREEN}Docker image built successfully!${NC}"; \
	else \
				echo "${RED}Error: Setup not completed!${NC}"; \
				echo "${YELLOW}Run 'make setup' to complete the setup.${NC}"; \
				exit 1; \
		fi

app-shell: ## Open a terminal in the App container
	@echo "${YELLOW}Opening a terminal in the App container...${NC}"
	@if docker ps | grep -q fp-api-rest; then \
		docker exec -it fp-api-rest zsh || docker exec -it fp-api-rest bash; \
		echo "${GREEN}Terminal closed.${NC}"; \
	else \
		echo "${RED}Error: Container 'fp-api-rest' is not running!${NC}"; \
		echo "${YELLOW}Try starting the container with 'make sail-up' first.${NC}"; \
		exit 1; \
	fi

migrate: ## Run migrations
	@echo "${YELLOW}Running migrations...${NC}"
	php artisan migrate
	@echo "${GREEN}Migrations completed successfully!${NC}"

seed: ## Run seeders
	@echo "${YELLOW}Running seeders...${NC}"
	php artisan db:seed
	@echo "${GREEN}Seeders executed successfully!${NC}"

fresh-seed: ## Run fresh migrations with seeders
	@echo "${YELLOW}Running fresh migrations with seeders...${NC}"
	php artisan migrate:fresh --seed
	@echo "${GREEN}Fresh migrations with seeders completed successfully!${NC}"

serve: ## Run the application
	@echo "${YELLOW}Starting the application...${NC}"
	php artisan serve
	@echo "${GREEN}Application stopped.${NC}"

test: ## Run tests
	@echo "${YELLOW}Running tests...${NC}"
	php artisan test
	@echo "${GREEN}Tests completed.${NC}"

test-coverage: ## Run tests with coverage
	@echo "${YELLOW}Running tests with coverage...${NC}"
	php artisan test --coverage
	@echo "${GREEN}Tests completed.${NC}"

generate-git-log: ## Generate a git log file (last 400 commits)
	@echo "${YELLOW}Generating git log file...${NC}"
	@sh tools/programs/generate-git-log.sh $$(git rev-parse --abbrev-ref HEAD) 400
	@if [ $$? -eq 0 ]; then \
		echo "${GREEN}Git log file generated successfully!${NC}"; \
	else \
		echo "${RED}Failed to generate git log file!${NC}"; \
		exit 1; \
	fi

generate-git-log-all: ## Generate a full git log file
	@echo "${YELLOW}Generating full git log file...${NC}"
	@sh tools/programs/generate-git-log.sh $$(git rev-parse --abbrev-ref HEAD) 9999999
	@if [ $$? -eq 0 ]; then \
		echo "${GREEN}Full git log file generated successfully!${NC}"; \
	else \
		echo "${RED}Failed to generate full git log file!${NC}"; \
		exit 1; \
	fi

generate-project-structure: ## Generate a project structure document
	@echo "${YELLOW}Generating project structure...${NC}"
	@if command -v eza >/dev/null 2>&1; then \
		eza --tree --level=8 --git-ignore --ignore-glob="vendor|node_modules|.git|storage|bootstrap/cache|*.log" > project-structure.txt; \
		echo "${GREEN}Project structure generated successfully in project-structure.txt!${NC}"; \
	else \
		echo "${RED}Error: eza is not installed. Please install eza first.${NC}"; \
		echo "${YELLOW}You can install it with:${NC}"; \
		echo "  - macOS: brew install eza"; \
		echo "  - Linux: see https://github.com/eza-community/eza#installation"; \
		exit 1; \
	fi

setup: install env ssl ## Complete setup: install dependencies, create .env, generate SSL certificates
	@echo "${GREEN}${BOLD}Setup completed successfully!${NC}"
	@echo "${YELLOW}${BOLD}Next steps:${NC}"
	@echo "1. Update your environment variables in .env file if needed"
	@echo "2. Run '${GREEN}make sail-up${NC}' to start Laravel Sail"
	@echo "3. Run '${GREEN}make migrate${NC}' to run migrations"
	@echo "4. Run '${GREEN}make seed${NC}' to run seeders"
	@echo "5. Access your application at ${BLUE}https://<host>${NC}"
