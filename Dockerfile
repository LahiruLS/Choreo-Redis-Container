FROM redis
ARG REDIS_PASSWORD=SUPER_SECRET_PASSWORD
# Create a user with a known UID/GID within range 10000-20000.
# This is required by Choreo to run the container as a non-root user.
RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password --no-create-home --uid 10014 --ingroup choreo choreouser
EXPOSE 6379
ENTRYPOINT ["redis-server","--appendonly"]
CMD ["yes","--requirepass","SUPER_SECRET_PASSWORD"]
