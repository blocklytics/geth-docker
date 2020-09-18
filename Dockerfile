FROM ethereum/client-go:v1.9.21

COPY is-geth-synchronized.sh /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/is-geth-synchronized.sh"]
RUN apk update
RUN apk add --no-cache jq