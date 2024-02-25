all:
	@docker-compose -f srcs/docker-compose.yml up -d --build
down:
	@docker-compose -f srcs/docker-compose.yml down
clean:
	@docker stop $$(docker ps -qa);
	@rm -rf $(HOME)/data/wordpress/* ;
	@rm -rf $(HOME)/data/mysql ;
	@docker rm -f $$(docker ps -qa);
	@docker rmi -f $$(docker images -q);
	@docker volume rm -f $$(docker volume ls -q);
	@docker network rm srcs_jsebastinet;
