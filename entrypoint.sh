#!/bin/bash
set -e

if [[ -z "${KEYCLOAK_HTTP_RELATIVE_PATH}" ]]; then
  HTTP_RELATIVE_PATH=""
else
  HTTP_RELATIVE_PATH="${KEYCLOAK_HTTP_RELATIVE_PATH}"/
fi

sed -i -e 's#<pattern-formatter pattern=\".*\"\/>#<pattern-formatter pattern=\"%d{dd.MM.yyyy HH:mm:ss.SSS} %-5p (%13F:%L) %3x - %m%n\"\/>#' /opt/jboss/keycloak/standalone/configuration/standalone.xml
sed -i -e 's#<pattern-formatter pattern=\".*\"\/>#<pattern-formatter pattern=\"%d{dd.MM.yyyy HH:mm:ss.SSS} %-5p (%13F:%L) %3x - %m%n\"\/>#' /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
sed -i -e 's#<web-context>auth<\/web-context>#<web-context>'"$HTTP_RELATIVE_PATH"'auth<\/web-context>#' /opt/jboss/keycloak/standalone/configuration/standalone.xml
sed -i -e 's#<web-context>auth<\/web-context>#<web-context>'"$HTTP_RELATIVE_PATH"'auth<\/web-context>#' /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
sed -i -e 's#\/auth#\/'"$HTTP_RELATIVE_PATH"'auth#' /opt/jboss/keycloak/welcome-content/index.html 

/opt/jboss/tools/docker-entrypoint.sh
