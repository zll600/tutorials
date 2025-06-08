all: build push restart

build:
	docker build -t zll600/express:latest -f express/Dockerfile express

push:
	docker push zll600/express:latest

restart:
	kubectl rollout restart deployment express

run:
	node express/server.js

run-docker:
	docker run -p 8080:8080 zll600/express:latest
