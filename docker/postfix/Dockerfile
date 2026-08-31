FROM alpine:3.24

RUN apk add --no-cache \
    postfix \
    postfix-mysql \
    cyrus-sasl \
    cyrus-sasl-login \
    mailx \
    bash \
    rsyslog \
    ca-certificates

COPY main.cf /etc/postfix/main.cf
COPY master.cf /etc/postfix/master.cf
COPY mysql-*.cf /etc/postfix/
COPY start.sh /start.sh

RUN chmod +x /start.sh && \
    chmod 640 /etc/postfix/mysql-*.cf

EXPOSE 25 587

CMD ["/start.sh"]
