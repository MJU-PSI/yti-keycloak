FROM jboss/keycloak

ENV TZ=Europe/Ljubljana

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]