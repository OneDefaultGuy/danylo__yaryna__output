
myUID := $(shell id --user)

.PHONY: echo-i-uid
# Echo user id
echo-i-uid:
	@echo ${myUID}
.PHONY: d-homework-i-run
# Make all actions needed for run homework from zero.
d-homework-i-run:
	@make init-configs &&\
	make d-run


.PHONY: init-configs
# Configuration files initialization
init-configs:
	@cp compose.override.dev.yaml compose.override.yaml


.PHONY: d-run
# Just run
d-run:
	@export myUID=${myUID} &&\
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker compose up \
			--build

.PHONY: init-dev
# Init environment for development
init-dev:
	@pip install --upgrade pip && \
	pip install --requirement requirements/locale.txt && \
	pre-commit install





