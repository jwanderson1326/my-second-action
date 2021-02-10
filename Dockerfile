FROM alpine:latest

RUN apk update && apk add jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
