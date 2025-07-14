AWS_REGION := eu-west-1
BACKEND_IMAGE_NAME := rails_app
WEBSERVER_IMAGE_NAME := webserver

ACCOUNT_ID :=$(shell aws sts get-caller-identity \
			--query Account \
			--output text)

ecr-login:
	aws ecr get-login-password --region $(AWS_REGION) | \
		docker login \
			--username AWS \
			--password-stdin $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

build:
	docker-compose build

tag:
	$(eval BACKEND_ECR_URL := $(shell cd infrastructure && terraform output -raw backend_ecr_url))
	$(eval WEBSERVER_ECR_URL := $(shell cd infrastructure && terraform output -raw webserver_ecr_url))
	docker tag $(BACKEND_IMAGE_NAME):latest $(BACKEND_ECR_URL):latest
	docker tag $(WEBSERVER_IMAGE_NAME):latest $(WEBSERVER_ECR_URL):latest

push:
	$(eval BACKEND_ECR_URL := $(shell cd infrastructure && terraform output -raw backend_ecr_url))
	$(eval WEBSERVER_ECR_URL := $(shell cd infrastructure && terraform output -raw webserver_ecr_url))
	docker push $(BACKEND_ECR_URL):latest
	docker push $(WEBSERVER_ECR_URL):latest

build-repo:
	cd infrastructure && $(MAKE) create-ecr

.PHONY: ecr-login build tag push deploy

ecr-publish: build-repo ecr-login build tag push
	@echo "Docker images pushed to ECR."
