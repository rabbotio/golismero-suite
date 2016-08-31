all:

clean:
	docker-compose down --remove-orphans

build:
	docker-compose build

run: clean build
	docker-compose up -d
	echo "Waiting for all services to start."
	sleep 300
	echo "Starting scan..."
	docker exec -it run.sh

develop: clean build run
	docker exec -it golismero bash

.PHONY: all clean build run develop
