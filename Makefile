###COLORS###

DEF_COLOR =	\033[0;39m
RED =		\033[0;91m
DARK_YELLOW =	\033[38;5;143m
BROWN =		\033[38;2;184;143;29m
DARK_GRAY =	\033[38;5;234m
DARK_GREEN =	\033[1m\033[38;2;75;179;82m

.PHONY: all build up stop clean prune re create_directories

all: build up

build: dirs srcs/requirements/nginx/certs/entrypoint.sh
	chmod +x srcs/requirements/nginx/certs/entrypoint.sh
	./srcs/requirements/nginx/certs/entrypoint.sh
	docker compose -f srcs/docker-compose.yml build

up: dirs
	docker compose -f srcs/docker-compose.yml up -d

stop:
	docker compose -f srcs/docker-compose.yml stop

clean:
	@docker compose -f srcs/docker-compose.yml down 
	@echo "$(DARK_GREEN)Images Clean$(DEF_COLOR)"
	@docker compose -f srcs/docker-compose.yml down --rmi local
	@echo "$(DARK_GREEN)Volmues Clean$(DEF_COLOR)"
	@docker volume rm $$(docker volume ls -q) 

fclean: clean
	@sudo rm -rf /home/framos-p/data/wordpress
	@sudo rm -rf /home/framos-p/data/mariadb
	@echo "$(DARK_GREEN)Directories Clean$(DEF_COLOR)"

prune:
	yes | docker system prune -a --volumes

re : clean all

dirs:
	@mkdir -p /home/framos-p/data/wordpress
	@mkdir -p /home/framos-p/data/mariadb

.SILENT:
