
FROM alpine:latest

# Instalacion de bash

RUN apk add --no-cache bash

WORKDIR /app


COPY main.sh .

RUN chmod +x main.sh


ENTRYPOINT ["./main.sh", "-a"]
