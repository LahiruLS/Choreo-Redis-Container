FROM redis
ARG REDIS_PASSWORD=SUPER_SECRET_PASSWORD
# Create a user with a known UID/GID within range 10000-20000.
# This is required by Choreo to run the container as a non-root user.
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo"
# Use the above created unprivileged user
USER 10014
EXPOSE 6379
ENTRYPOINT ["redis-server","--appendonly"]
CMD ["yes","--requirepass","SUPER_SECRET_PASSWORD"]
