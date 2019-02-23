GITCOMMIT_SHORT = $(shell git rev-parse --short HEAD)
GIT_TAG ?= $(or ${TRAVIS_TAG},${TRAVIS_TAG},${GITCOMMIT_SHORT})
VERSION ?= ${GIT_TAG}
GITCOMMIT ?= $(shell git rev-parse HEAD)

DATE ?= $(shell date -u "+%Y-%m-%dT%H:%M:%SZ")

REGISTRY ?= quay.io
IMAGE_PREFIX ?= sandromello

IMAGE := ${REGISTRY}/${IMAGE_PREFIX}/${SHORT_NAME}:${VERSION}

all: docker-build docker-push

info:
	@echo "Build tag:       ${VERSION}"
	@echo "Registry:        ${REGISTRY}"
	@echo "Immutable tag:   ${IMAGE}"
