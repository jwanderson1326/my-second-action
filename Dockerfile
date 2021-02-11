FROM alpine:latest

RUN apk update && apk add jq bash curl

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
