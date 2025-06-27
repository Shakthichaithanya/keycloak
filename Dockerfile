FROM quay.io/keycloak/keycloak:24.0.4

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Copy the custom theme into Keycloak's themes directory
COPY themes /opt/keycloak/themes

# Build the server with your theme
RUN /opt/keycloak/bin/kc.sh build

# Start in development mode (for production use "start")
CMD ["start"]