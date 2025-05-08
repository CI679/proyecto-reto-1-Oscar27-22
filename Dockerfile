FROM alpine:latest

WORKDIR /app

COPY main.sh .

RUN chmod +x main.sh

RUN apk add --no-cache bash

ENV method="-a"  

CMD bash -c "./main.sh ${method}"
