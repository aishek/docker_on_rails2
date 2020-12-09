# README

## Development

### Start using separate docker-compose call

1. `docker-compose -f docker-compose-services.yml up development`
2. `bundle exec rails s`

### Start using processes manager

`overmind s` or `make start`

### Start using pure Docker environment

`docker-compose up rails webpacker`

To run single command:

`docker-compose run --rm runner bundle`
`docker-compose run --rm runner yarn`
`docker-compose run --rm runner rails db:setup`
