#!/usr/bin/env ruby

# We bundle install on build.
# We bundle install on start too in development.
if [nil, "development"].include?(ENV["RAILS_ENV"])
  system "bundle install"
end
system "yarn install"

# Cron is useful for scheduling jobs to start
# automatically at specified times.
system "service cron start"

system "wait-for-it postgres:5432"
system "wait-for-it redis:6379"

exec <<~HEREDOC
  bundle exec sidekiq
HEREDOC
