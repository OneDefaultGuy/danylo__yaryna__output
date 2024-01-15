myUID := $(shell id --user)

.PHONY: echo-i-uid
# Echo user id
echo-i-uid:
	@echo ${myUID}
.PHONY: d-homework-i-run

d-homework-i-run:
	make d-run

.PHONY: make-d-homework-i-purge

d-homework-i-purge:
	make d-purge

.PHONY: d-run

d-run:
	@export myUID=${myUID} &&\
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker compose up \
			--build

.PHONY: init-dev

init-dev:
	pip install --upgrade pip && \
	pip install --requirement requirements/base.txt && \
	echo "Initialization complete"

.PHONY: d-purge

d-purge:
	@export myUID=${myUID} &&\
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker compose down --volumes --remove-orphans --rmi local --timeout 0



