# inherited https://github.com/ethereum/go-ethereum/blob/master/Dockerfile
FROM ethereum/client-go

COPY health /

EXPOSE 8545 8546 30303 30303/udp