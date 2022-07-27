COMMIT_SHA := $(shell git rev-parse --short HEAD)
GIT_REF := $(shell git rev-parse --abbrev-ref HEAD)
TIMESTAMP := $(shell date '+%s')
VERSION := "v1.5.1"
DOCKER_IMAGE := "qonto/kowl:$(VERSION)"
test:
	go test backend/...

build:
	docker build -t $(DOCKER_IMAGE) --build-arg KOWL_GIT_SHA=$(COMMIT_SHA)  --build-arg KOWL_GIT_REF=$(GIT_REF)  --build-arg KOWL_TIMESTAMP=$(TIMESTAMP) .

push:
	docker push $(DOCKER_IMAGE)