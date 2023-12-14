.PHONY: build push

build:
	docker buildx build --platform linux/arm64 -t common/aws-lamda-ric-nodejs . && docker tag common/aws-lamda-ric-nodejs 671123374425.dkr.ecr.eu-central-1.amazonaws.com/common/aws-lamda-ric-nodejs && docker image prune --force

push:
	aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 671123374425.dkr.ecr.eu-central-1.amazonaws.com && docker push 671123374425.dkr.ecr.eu-central-1.amazonaws.com/common/aws-lamda-ric-nodejs