# inherited https://github.com/ethereum/go-ethereum/blob/master/Dockerfile
FROM ethereum/client-go:v1.9.21

USER root
ADD . /usr/src/app
WORKDIR /usr/src/app

ENV LANG C.UTF-8
RUN apk update && \
    apk add --no-cache ca-certificates python3 python3-dev gcc linux-headers libc-dev bash curl && \
    apk add --no-cache py3-pip && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
RUN pip3 install -r requirements.txt

EXPOSE 8000 8545 8546 30303 30303/udp