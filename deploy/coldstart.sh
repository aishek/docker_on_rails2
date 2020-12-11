docker-compose run --entrypoint="rails db:setup" --rm -e DISABLE_DATABASE_ENVIRONMENT_CHECK=1 blue

docker-compose up -d nginx-proxy blue green
