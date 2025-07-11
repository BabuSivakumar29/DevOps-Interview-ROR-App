
export COMPOSE_FILE_MAIN=docker-compose.yml

dc-do:
	docker-compose \
		-f $(COMPOSE_FILE_MAIN) \
	    $(DC_ACTION)

build:
	DC_ACTION="build ${SERVICE}" $(MAKE) dc-do
