#!/bin/sh

echo "Starting witchcult.shop app"
while ! nc -z "$POSTGRES_HOST" "$POSTGRES_PORT"
do
  echo "Waiting for postgresql"
  sleep 1
done

echo "Connecting to postgresql"
bundle exec sequel -m ./migrations postgres://psql:postgres-devel@postgres:5432/witchcult-shops
bundle exec rackup -o 0.0.0.0 -p 9000
