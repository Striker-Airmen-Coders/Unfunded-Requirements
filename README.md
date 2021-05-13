# README
---

## Setting up a development environment, using Docker
```bash
  # First, generate long, secure passwords for your local database and JWT secret:

  docker run ruby:2 ruby -e "require 'securerandom'; 2.times { puts(SecureRandom.base64(64)) }"
    # This does nothing but use a plain ruby container to generate a password. You can generate passwords in other ways too.
    # This has the benefit of testing you're set up and able to run code in Docker containers.

  # Now we need a docker-compose.override.yaml file:

  cp docker-compose.override.example-development.yaml docker-compose.override.yaml
    # Copy the example docker-compose.override file for development
  nano docker-compose.override.yaml
    # ...and open it with a text editor like nano (or atom or kakoune or nvim or vim or subl or ed or...)
    # This language is YAML. It's not a programming language, just a language to represent data or config data as text.
    # Take one of the generated passwords, and set each "environment:" section's "POSTGRES_PASSWORD" block to that password.
    # Take the other generated password, and set each "environment:" section's "DEVISE_JWT_SECRET_KEY" block to that password. Don't re-use the POSTGRES_PASSWORD.
    # All "POSTGRES_PASSWORD" sections should have the same password set, and all DEVISE_JWT_SECRET_KEY sections should have the same password set.

  docker-compose up -d --build
    # This will build the containers as we've defined them in docker-compose.yaml and docker-compose.override.yaml.
    # This uses docker-compose. Docker-compose is an optional tool associated with Docker, that just lets us write these yaml files describing our desired containers and builds them for us so we don't have to. It's not part of Docker, and there are a number of things you can do with either the docker or docker-compose commands, so don't conflate the two.
```

Now you've built the containers. The software that makes up this project runs entirely within the containers, so you'll need to shell into the containers to do some things:

```bash
  docker-compose exec rails bundle exec rails console
    # Run an interactive rails console in the container

  docker-compose start
    # Start the containers

  docker-compose restart rails
    # Restart one (or more) specific containers

  docker-compose exec rails bash
    # Get a Bash shell in a container

  docker attach my-project-name-rails
    # Attach to the container

  docker-compose logs -f --tail=100 rails jobs webpack-dev-server
    # Tail the logs of one or more specific containers
```
