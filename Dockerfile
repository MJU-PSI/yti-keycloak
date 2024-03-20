FROM quay.io/keycloak/keycloak:16.1.1

ENV TZ=Europe/Ljubljana

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]