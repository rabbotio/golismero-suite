all:

clean:
	docker-compose down --remove-orphans

build:
	docker-compose -f docker-compose.yml -f docker-compose.develop.yml build

run: clean
	docker-compose up -d

run-dev: clean build
	docker-compose -f docker-compose.yml -f docker-compose.develop.yml up

develop: clean build run
	docker exec -it golismero bash

.PHONY: all clean build run develop
