COMPOSE_YML := docker-compose.dev.yml
DC := docker compose -f $(COMPOSE_YML)


build:
	mkdir -p node_modules
	$(DC) build

up:
	$(DC) up
	@make logs

down:
	$(DC) down --remove-orphans

down-v:
	$(DC) down --remove-orphans --volumes

logs:
	$(DC) logs -f nextjs

sh:
	$(DC) exec nextjs sh

npm-install:
	$(DC) run --rm nextjs npm install

init:
	@make down-v
	@make build
	@make npm-install
	@make up
