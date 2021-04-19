FROM ruby:3.0.0

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update -qq && apt-get install -y \
  # for the container
  wait-for-it \
  dumb-init \
  # for a Rails JS runtime, and for Rails' JS package management
  nodejs \
  # for us
  build-essential \
  httpie \
  less \
  htop \
  cron \
  --no-install-recommends
RUN npm install -g yarn

RUN gem install bundler
COPY Gemfile /app
COPY Gemfile.lock /app
RUN bundle install
  # FIXME: I sure hope COPY-ing an updated Gemfile.lock busts the Docker cache for `RUN bundle install`

COPY docker/jobs/start.rb /start.rb
RUN chmod +x /start.rb

CMD [ "dumb-init", "--", "/start.rb" ]
