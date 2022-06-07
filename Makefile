up: #Containers start
	docker-compose up -d

down: #Stop
	docker-compose stop

ps:
	docker ps

connect_ruby:
	docker exec -it a9387cad3621 bash

connect_db:
	docker exec -it 00d6c687f8c6 bash