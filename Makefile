SHORT_NAME ?= products-api

include versioning.mk

test:
	docker run --rm -it ${REGISTRY}/${IMAGE_PREFIX}/${SHORT_NAME}:${VERSION} yarn test

docker-build:
	docker build -t ${REGISTRY}/${IMAGE_PREFIX}/${SHORT_NAME}:${VERSION}

docker-push:
	docker push ${REGISTRY}/${IMAGE_PREFIX}/${SHORT_NAME}:${VERSION}

.PHONY: test docker-build docker-push
