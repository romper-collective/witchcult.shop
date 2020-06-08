#!/bin/sh
bundle exec sequel -m ./migrations postgres://psql:postgres-devel@postgres:5432/witchcult-shops
bundle exec rackup -o 0.0.0.0 -p 9000
