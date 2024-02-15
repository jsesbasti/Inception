all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
down:
	@docker-compose -f ./srcs/docker-compose.yml down
clean:
	@sudo rm -rf $(HOME)/data/wordpress/* ;
	@sudo rm -rf $(HOME)/data/mysql ;
	@docker rm -f $$(docker ps -qa);
	@docker rmi -f $$(docker images -q);
	@docker volume rm -f $$(docker volume ls -q);
	@docker network rm srcs_jsebastinet;
