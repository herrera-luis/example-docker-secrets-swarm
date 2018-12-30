#!/bin/bash
docker swarm init

docker secret create pg-password ./pg-password
docker secret create pg-username ./pg-username
docker secret create pg-bdd ./pg-bdd

docker network create -d overlay my-lab

docker service create --name pg-test-secret --network my-lab \
            --secret pg-password --secret pg-username --secret pg-bdd \
            -e POSTGRES_PASSWORD_FILE="/run/secrets/pg-password" \
            -e POSTGRES_USER_FILE="/run/secrets/pg-username" \
            -e POSTGRES_DB_FILE="/run/secrets/pg-bdd" postgres

docker service create -p 99:80 --name=pgadmin --network my-lab \
            -e PGADMIN_DEFAULT_EMAIL=user@domain.com \
            -e PGADMIN_DEFAULT_PASSWORD=supersecret \
            -d dpage/pgadmin4