# inherited https://github.com/ethereum/go-ethereum/blob/master/Dockerfile
FROM ethereum/client-go:v1.9.21

USER root
ADD . /usr/src/app
WORKDIR /usr/src/app

ENV LANG C.UTF-8
RUN apk update && \
    apk add --no-cache ca-certificates python3 python3-dev py3-pip gcc g++ linux-headers libc-dev libstdc++ bash curl && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    curl -X PURGE https://pypi.org/simple/rusty-rlp/

RUN pip3 install --upgrade pip3
RUN pip3 install -U setuptools
RUN pip3 install rusty-rlp --no-cache-dir --index-url https://pypi.org/simple/rusty-rlp/

RUN pip3 install -r requirements.txt

EXPOSE 8000 8545 8546 30303 30303/udp