FROM ethereum/client-go:v1.9.21

COPY health.sh /usr/local/bin/

RUN apk update
RUN apk add --no-cache jq