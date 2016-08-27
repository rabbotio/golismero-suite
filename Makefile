all:

clean:
	docker-compose down --remove-orphans

build:
	docker-compose build

run: clean build
	docker-compose up

develop: clean build run
	docker exec -it golismero bash

.PHONY: all clean build run develop
