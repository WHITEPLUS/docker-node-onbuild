NAME      := node-onbuild
REGISTRY  := whiteplus/$(NAME)
VERSION   := 6.10.1

.PHONY: build tag push

build:
	docker build -t $(NAME):$(VERSION) .

tag: build
	docker tag $(NAME):$(VERSION) $(REGISTRY):$(VERSION)

push: tag
	docker push $(REGISTRY):$(VERSION)

