FROM quay.io/keycloak/keycloak:26.2.0

# Detecta puertos en Render
EXPOSE 8080
EXPOSE 8443

# Admin user & DB (Render los inyecta en tiempo de ejecución)
ENV KC_BOOTSTRAP_ADMIN_USERNAME=${KC_BOOTSTRAP_ADMIN_USERNAME}
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=${KC_BOOTSTRAP_ADMIN_PASSWORD}
ENV KC_DB=postgres
ENV KC_DB_URL=${KC_DB_URL}
ENV KC_DB_USERNAME=${KC_DB_USERNAME}
ENV KC_DB_PASSWORD=${KC_DB_PASSWORD}

# Proxy & HTTP settings
ENV KC_PROXY_HEADERS=xforwarded
ENV KC_HTTP_ENABLED=true
ENV PROXY_ADDRESS_FORWARDING=true
ENV KC_HOSTNAME_STRICT=false
# Si usas un path custom:
# ENV KC_HTTP_RELATIVE_PATH=/auth

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
