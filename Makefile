PROJECT=jslab
COMPOSE=docker compose

.PHONY: up down stop restart build rebuild rebuild-nocache logs ps shell nginx-reload

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

build:
	$(COMPOSE) build

rebuild:
	$(COMPOSE) up -d --build

rebuild-nocache:
	$(COMPOSE) build --no-cache
	$(COMPOSE) up -d

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

shell:
	docker exec -it $(PROJECT)-node bash

nginx-reload:
	docker exec -it $(PROJECT)-nginx nginx -s reload