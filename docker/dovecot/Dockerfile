FROM alpine:3.24

RUN apk add --no-cache \
    dovecot \
    dovecot-mysql \
    dovecot-lmtpd \
    dovecot-pop3d \
    bash \
    ca-certificates

# Create vmail user and group with UID/GID 5000
RUN addgroup -g 5000 vmail && \
    adduser -u 5000 -G vmail -s /sbin/nologin -h /var/mail/vhosts -D vmail

COPY dovecot.conf /etc/dovecot/dovecot.conf
COPY dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf.ext
COPY start.sh /start.sh

RUN chmod +x /start.sh && \
    chmod 600 /etc/dovecot/dovecot-sql.conf.ext && \
    mkdir -p /var/mail/vhosts && \
    chown -R vmail:vmail /var/mail/vhosts

EXPOSE 110 143 993 995 24 10000

CMD ["/start.sh"]
