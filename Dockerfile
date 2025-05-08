FROM alpine:latest

WORKDIR /app

COPY main.sh .

RUN chmod +x main.sh

RUN apk add --no-cache bash

# The default value of method
ENV method="-a"

# Execute main.sh with the value of $method in the exec-time
CMD ["bash", "-c", "./main.sh \"$method\""]
