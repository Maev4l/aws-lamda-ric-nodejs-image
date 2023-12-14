# AWS Lambda Runtime Interface Client for NodeJS docker image

## 1. Docker image registry

Create the ECR repository to host the handler Docker image.

```shell
aws ecr create-repository --repository-name common/aws-lamda-ric-nodejs --tags Key=application,Value=common/aws-lamda-ric-nodejs
aws ecr put-lifecycle-policy --repository-name common/aws-lamda-ric-nodejs --lifecycle-policy-text "file://ecr-lifecycle-policy.json"
```

### 2. Build image

```shell
make build
```

### 3. Push image

```shell
make push
```
