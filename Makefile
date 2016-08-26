all:

clean:
	docker-compose down --remove-orphans

build:
	docker-compose build

run: clean build
	docker-compose up
	@echo docker exec -it golismero golismero $(filter-out $@,$(MAKECMDGOALS))

develop: clean build run
	docker exec -it golismero bash

%:
    @:
.PHONY: all clean build run develop
