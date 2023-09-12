FROM jboss/keycloak

ENV TZ=Europe/Ljubljana

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]