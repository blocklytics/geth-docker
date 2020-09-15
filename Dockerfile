# inherited https://github.com/ethereum/go-ethereum/blob/master/Dockerfile
FROM ethereum/client-go:v1.9.21

USER root
ADD . /usr/src/app
WORKDIR /usr/src/app

ENV LANG C.UTF-8
RUN apk add --no-cache --virtual .build-deps g++ python3-dev py3-pip gcc linux-headers libc-dev bash curl libffi-dev openssl-dev && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools
RUN pip3 install -r requirements.txt

EXPOSE 8000 8545 8546 30303 30303/udp