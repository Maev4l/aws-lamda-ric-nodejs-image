ARG NODE_VERSION=20.10.0
ARG FUNCTION_DIR="/function"

FROM node:${NODE_VERSION}-bookworm-slim as aws-lambda-ric-build

RUN apt-get update && \
    apt-get install -y \
    g++ \
    make \
    cmake \
    unzip \
    libcurl4-openssl-dev \
    autoconf \
    libtool \
    python3 \
    python3-pip

# Include global arg in this stage of the build
ARG FUNCTION_DIR
RUN mkdir -p ${FUNCTION_DIR}
WORKDIR ${FUNCTION_DIR}
RUN npm install --cpu=arm64 --os=linux aws-lambda-ric --exact

FROM node:${NODE_VERSION}-bookworm-slim

# Include global arg in this stage of the build
ARG FUNCTION_DIR
RUN mkdir -p ${FUNCTION_DIR}
WORKDIR ${FUNCTION_DIR}

COPY --from=aws-lambda-ric-build ${FUNCTION_DIR} ${FUNCTION_DIR}
