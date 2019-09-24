APP_NAME = nginx

unlock:
	./unlock.sh

build:
	docker-compose build $(APP_NAME)

push:
	./docker-push.sh
