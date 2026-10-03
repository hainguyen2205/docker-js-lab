PROJECT=sendly
COMPOSE=docker compose

.PHONY: up down stop restart logs ps shell

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

shell:
	docker exec -it $(PROJECT)-mongodb mongosh -u $${MONGO_ROOT_USERNAME} -p $${MONGO_ROOT_PASSWORD} --authenticationDatabase admin
