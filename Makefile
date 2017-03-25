.DEFAULT_GOAL := help

NETWORK_NAME=php_docker
EXTERNAL_PROJECT=externalapp

install:
	@make up-network
	@make up-external-app
	@make up-lb
	
up-network: ## Create a docker network
	@docker network create -d bridge $(NETWORK_NAME)

up-external-app: ## up the external upp
	@docker-compose -p $(EXTERNAL_PROJECT) -f apps/api/docker-compose.yml build
	@docker-compose -p $(EXTERNAL_PROJECT) -f apps/api/docker-compose.yml up -d

up-lb: ## up docker loadBalancer
	@docker-compose -f loadBalancer/docker-compose.yml build
	@docker-compose -f loadBalancer/docker-compose.yml up -d

uninstall:
	@make down-external-app
	@make down-lb
	@make down-network

down-network: ## Destroy the docker network
	@docker network rm $(NETWORK_NAME)

down-external-app: # Destroy the external app
	@docker-compose -p $(EXTERNAL_PROJECT) -f apps/api/docker-compose.yml down

down-lb: ## Destroy the docker loadBalancer
	@docker-compose -f loadBalancer/docker-compose.yml down

scale-api: ## Scale api app
	@docker-compose -p $(EXTERNAL_PROJECT) -f apps/api/docker-compose.yml scale api=$(CANT)

scale-web: ## Scale web app
	@docker-compose -f loadBalancer/docker-compose.yml scale web=$(CANT)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'