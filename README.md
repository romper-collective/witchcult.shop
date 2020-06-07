# witchcult.shop

## Development

Run the server with:

```
bundle install
bundle exec rackup
```

There is also a docker-compose based development environment:

```sh
docker-compose build
docker-compose up
```

### Running the tests

To run the tests in a docker-compose environment, do:

```sh
docker-compose build
docker-compose up -d
docker-compose exec web bundle exec rspec
```
