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

### Deployment

This application includes a [`helm`][helm] chart for deployment to Kubernetes
clusters. If you have `kubectl` and Helm 3 installed and a cluster configured,
you can deploy with:

```sh
helm install [name] ./chart/witchcult.shop
```

[helm]: https://helm.sh
