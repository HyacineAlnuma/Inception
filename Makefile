.PHONY: build up stop down status clear

# ----- COLORS ----- #

_END			= \033[0m
_GREY			= \033[0;30m
_RED			= \033[0;31m
_GREEN			= \033[0;32m
_YELLOW			= \033[0;33m
_BLUE			= \033[0;34m
_PURPLE			= \033[0;35m
_CYAN			= \033[0;36m
_BOLD			= \e[1m

# ----- PATHS ----- #

P_COMPOSE		= ./srcs/docker-compose.yml

# ----- COMMANDS ----- #

COMPOSE			= docker compose -f $(P_COMPOSE)

build:
				@echo "$(_PURPLE)$(_BOLD)>>>Executing docker build$(_END)"
				@sudo $(COMPOSE) up --build -d

up:
				@echo "$(_PURPLE)$(_BOLD)>>>Executing docker up$(_END)"
				@sudo $(COMPOSE) up -d

stop:
				@echo "$(_PURPLE)$(_BOLD)>>>Executing docker stop$(_END)"
				@sudo $(COMPOSE) stop

down:
				@echo "$(_PURPLE)$(_BOLD)>>>Executing docker down$(_END)"
				@sudo $(COMPOSE) down

status:
				@echo "$(_CYAN)$(_BOLD)[DOCKER IMAGES]$(_END)"
				@sudo docker image ls
				@echo ""
				@echo "$(_CYAN)$(_BOLD)[DOCKER CONTAINERS]$(_END)"
				@sudo docker ps -a

clean_vol:
				@echo "$(_PURPLE)$(_BOLD)>>>Cleaning volumes$(_END)"
				@sudo rm -rf /home/halnuma/data/wordpress/*
				@sudo rm -rf /home/halnuma/data/db/*

clean: down
				@echo "$(_PURPLE)$(_BOLD)>>>Deleting containers$(_END)"
				@sudo docker system prune -f --all

fclean: down clean_vol
				@echo "$(_PURPLE)$(_BOLD)>>>Deleting containers and volumes$(_END)"
				@sudo docker system prune -f --all

re: clean up