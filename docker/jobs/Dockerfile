FROM ruby:2

WORKDIR /app

RUN apt-get update -qq && apt-get install -y \
  # for the container
  wait-for-it \
  dumb-init \
  # for a Rails JS runtime
  nodejs \
  # for us
  build-essential \
  httpie \
  less \
  htop \
  yarnpkg \
  cron \
  --no-install-recommends
RUN ln -s `which yarnpkg` /usr/local/bin/yarn

RUN gem install bundler
COPY Gemfile /app
COPY Gemfile.lock /app
RUN bundle install
  # FIXME: I sure hope COPY-ing an updated Gemfile.lock

COPY docker/jobs/start.rb /start.rb
RUN chmod +x /start.rb

CMD [ "dumb-init", "--", "/start.rb" ]
