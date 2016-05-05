.PHONY: default build upload

default: build

build:
	docker build -t gtaylor/caddy-for-drone:latest -t gtaylor/caddy-for-drone:0.8.3 .

upload:
	docker push gtaylor/caddy-for-drone:latest
	docker push gtaylor/caddy-for-drone:0.8.3
