## Flink Smaple Code (EMR on EKS)

This repository provide a sample code for Flink(EMR on EKS).

### Data pipeline

The Sample code consume data from **Kinesis Data Streams**, and write data into S3 bucket with parquet files.

### Build

```shell
cd emr-eks-flink-java
mvn clean install
```


### Build Docker Image (Parquet File)


```shell

cd emr-eks-flink-java/docker/

export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
export EMR_VERSION=6.14.0
export IMAGE_VERSION=1.7.3

# get EMR on EKS base image
# us-east-1
export SRC_ECR_URL=755674844232.dkr.ecr.us-east-1.amazonaws.com
ECR_URL=$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL
aws ecr create-repository --repository-name eks-flink --image-scanning-configuration scanOnPush=true

export SRC_ECR_URL=755674844232.dkr.ecr.$AWS_REGION.amazonaws.com
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $SRC_ECR_URL

# pull flink base image
docker pull $SRC_ECR_URL/flink/emr-$EMR_VERSION-flink:latest

docker build -t $ECR_URL/eks-flink:emr-$EMR_VERSION-java-$IMAGE_VERSION -f ./Dockerfile --no-cache=true --build-arg FLINK_BASE_IMAGE=$SRC_ECR_URL/flink/emr-$EMR_VERSION-flink:latest .

docker push $ECR_URL/eks-flink:emr-$EMR_VERSION-java-$IMAGE_VERSION
```


### Build Docker Image (Iceberg Table)


```shell

cd emr-eks-flink-java/docker/

export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
export EMR_VERSION=6.14.0
export IMAGE_VERSION=1.7.3

# get EMR on EKS base image
# us-east-1
export SRC_ECR_URL=755674844232.dkr.ecr.us-east-1.amazonaws.com
ECR_URL=$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL
aws ecr create-repository --repository-name eks-flink --image-scanning-configuration scanOnPush=true

export SRC_ECR_URL=755674844232.dkr.ecr.$AWS_REGION.amazonaws.com
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $SRC_ECR_URL

# pull flink base image
docker pull $SRC_ECR_URL/flink/emr-$EMR_VERSION-flink:latest

docker build -t $ECR_URL/eks-flink:emr-$EMR_VERSION-java-$IMAGE_VERSION -f ./Dockerfile-Iceberg --no-cache=true --build-arg FLINK_BASE_IMAGE=$SRC_ECR_URL/flink/emr-$EMR_VERSION-flink:latest .

docker push $ECR_URL/eks-flink:emr-$EMR_VERSION-java-$IMAGE_VERSION
```
