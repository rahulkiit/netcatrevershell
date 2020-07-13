FROM alpine:latest

COPY ./entrypoint.sh /

RUN	apk --no-cache add netcat-openbsd
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
