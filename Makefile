COMPOSE_YML := docker-compose.dev.yml
DC := docker compose -f $(COMPOSE_YML)
SERVICE := nextjs


build:
	mkdir -p node_modules
	$(DC) build

up:
	$(DC) up -d

down:
	$(DC) down --remove-orphans

down-v:
	$(DC) down --remove-orphans --volumes

logs:
	$(DC) logs -f $(SERVICE)

sh:
	$(DC) exec $(SERVICE) sh

npm-install:
	$(DC) run --rm $(SERVICE) npm install

init:
	@make down-v
	@make build
	@make npm-install
	@make up
	@make logs
