FROM redis
# ARG REDIS_PASSWORD=SUPER_SECRET_PASSWORD
COPY ./script.sh /
# Create a user with a known UID/GID within range 10000-20000.
# This is required by Choreo to run the container as a non-root user.
RUN \
    adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo" && chmod +x /script.sh
# Use the above created unprivileged user
USER 10014
# USER root
EXPOSE 6379
COPY /script.sh /
# RUN chmod +x /script.sh
ENTRYPOINT ["/script.sh"]
# ENTRYPOINT ["redis-server"]
# CMD ["--appendonly","yes","--requirepass","SUPER_SECRET_PASSWORD"]
