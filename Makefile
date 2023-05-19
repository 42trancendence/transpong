NAME = transpong

all:
	docker-compose up --build

down:
	docker stop `docker ps -a -q`

re: clean
	docker-compose up --build

clean:  down
		docker rm `docker ps -a -q`

fclean: clean
		docker network prune -f
		docker volume prune -f
		docker image prune -a -f

.PHONY: all down re clean fclean