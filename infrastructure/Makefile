export AWS_REGION=eu-west-1
export PROJECT_NAME=rails-app


check_defined = \
	$(strip $(foreach 1,$1, $(call __check_defined,$1,$(strip $(value 2)))))

__check_defined = \
	$(if $(value $1),, $(error Undefined $1$(if $2, ($2))))

verify-terraform-params:
	@:$(call check_defined, \
			PROJECT_NAME \
			AWS_ACCESS_KEY_ID \
			AWS_SECRET_ACCESS_KEY \
			AWS_SESSION_TOKEN \
			AWS_REGION \
	)

init:
	$(check_defined, PROJECT_NAME AWS_REGION)
	terraform init

validate:
	terraform validate

plan: verify-terraform-params
	terraform plan \
		-out='$(PROJECT_NAME)-plan-file' \
		-var 'aws_access_key=$(AWS_ACCESS_KEY_ID)' \
		-var 'aws_secret_key=$(AWS_SECRET_ACCESS_KEY)' \
		-var 'aws_session_token=$(AWS_SESSION_TOKEN)'

plan-destroy: verify-terraform-params
	terraform plan \
		-destroy \
		-out='$(PROJECT_NAME)-destroy-plan-file' \
		-var 'aws_access_key=$(AWS_ACCESS_KEY_ID)' \
		-var 'aws_secret_key=$(AWS_SECRET_ACCESS_KEY)' \
		-var 'aws_session_token=$(AWS_SESSION_TOKEN)'

apply: $(check_defined, PROJECT_NAME)
	terraform apply $(PROJECT_NAME)-plan-file

destroy: $(check_defined, PROJECT_NAME)
	terraform apply $(PROJECT_NAME)-destroy-plan-file

refresh:
	terraform apply -refresh-only

create-ecr: verify-terraform-params
	terraform init && \
	terraform plan \
		-target=module.ecr_backend \
		-target=module.ecr_webserver \
		-out='$(PROJECT_NAME)-plan-file' \
		-var 'aws_access_key=$(AWS_ACCESS_KEY_ID)' \
		-var 'aws_secret_key=$(AWS_SECRET_ACCESS_KEY)' \
		-var 'aws_session_token=$(AWS_SESSION_TOKEN)' && \
	$(MAKE) apply

