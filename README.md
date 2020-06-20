# witchcult.shop

[![build status](https://github.com/romper-collective/witchcult.shop/workflows/RSpec/badge.svg)](https://github.com/romper-collective/witchcult.shop/actions)

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

You can now get an application console with `docker-compose exec web racksh`.

### Running the tests

To run the tests in a docker-compose environment, do:

```sh
docker-compose build
docker-compose up -d
docker-compose exec web bundle exec rspec
```
