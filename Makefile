export AWS_REGION=eu-west-1
export COMPOSE_FILE_MAIN=docker-compose.yml
export ACCOUNT_ID=$(aws sts get-caller-identity \
			--query Account \
			--output text)

dc-do:
	docker-compose \
		-f $(COMPOSE_FILE_MAIN) \
	    $(DC_ACTION)

build:
	DC_ACTION="build ${SERVICE}" $(MAKE) dc-do

ecr-login:
	@aws ecr get-login-password --region $(AWS_REGION) | \
		docker login \
			--username AWS \
			--password-stdin $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com
