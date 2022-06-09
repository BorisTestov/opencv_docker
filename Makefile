NAME=opencv
TAG=4.5.3-openvino-2021.4.2

build:
	docker build -m 4g -t ${NAME}:${TAG} .

.PHONY: build
