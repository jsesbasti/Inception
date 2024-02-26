UNAME	= $(shell uname -s)

ifeq ($(UNAME), Darwin)
	FLAGS	= 
else ifeq ($(UNAME), Linux)
	FLAGS	= sudo
endif

all:
	if (! -d $(HOME)/data/wordpress); then mkdir -p $(HOME)/data/wordpress; fi
	if (! -d $(HOME)/data/mysql); then mkdir -p $(HOME)/data/mysql; fi
	@docker-compose -f srcs/docker-compose.yml up -d --build
down:
	@docker-compose -f srcs/docker-compose.yml down
clean:
	@docker stop $$(docker ps -qa);
	@$(FLAGS) rm -rf $(HOME)/data/wordpress/* ;
	@docker rm -f $$(docker ps -qa);
	@docker rmi -f $$(docker images -q);
	@docker volume rm -f $$(docker volume ls -q);
	@docker network rm srcs_jsebastinet;
	@docker system prune -a -f;

re: clean all
