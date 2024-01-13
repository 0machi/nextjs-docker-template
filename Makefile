COMPOSE_YML := docker-compose.dev.yml
DC := docker compose -f $(COMPOSE_YML)


build:
	$(DC) build

up:
	$(DC) up -d

sh:
	$(DC) exec nextjs sh
