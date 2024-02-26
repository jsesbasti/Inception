UNAME	= $(shell uname -s)
DATA	= $(HOME)/data

ifeq ($(UNAME), Darwin)
	FLAGS	= 
else ifeq ($(UNAME), Linux)
	FLAGS	= sudo
endif

all:
	@$(FLAGS) mkdir -p $(DATA)/wordpress;
	@$(FLAGS) mkdir -p $(DATA)/mysql;
	@$(FLAGS) mkdir -p $(DATA)/redis;
	@docker-compose -f srcs/docker-compose.yml up -d --build
down:
	@docker-compose -f srcs/docker-compose.yml down
clean:
	@docker stop $$(docker ps -qa);
	@$(FLAGS) rm -rf $(HOME)/data ;
	@docker rm -f $$(docker ps -qa);
	@docker rmi -f $$(docker images -q);
	@docker volume rm -f $$(docker volume ls -q);
	@docker network rm srcs_jsebastinet;
	@docker system prune -a -f;

re: clean all