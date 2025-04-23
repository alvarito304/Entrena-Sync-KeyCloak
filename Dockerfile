FROM quay.io/keycloak/keycloak:26.2.0

# Para que Render detecte puertos
EXPOSE 8080
EXPOSE 8443

# Variables para Keycloak y Postgres
ENV KC_BOOTSTRAP_ADMIN_USERNAME=${KC_BOOTSTRAP_ADMIN_USERNAME}
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=${KC_BOOTSTRAP_ADMIN_PASSWORD}
ENV KC_DB=postgres
ENV KC_DB_URL=${KC_DB_URL}
ENV KC_DB_USERNAME=${KC_DB_USERNAME}
ENV KC_DB_PASSWORD=${KC_DB_PASSWORD}

# Haz que Keycloak use el puerto de Render
ENV KC_HTTP_PORT=8080
ENV KC_HTTPS_PORT=8443

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]
