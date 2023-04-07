FROM jboss/keycloak

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]