#!/bin/sh
redis-server --requirepass "SECRET_PASSWORD" && config set stop-writes-on-bgsave-error no
