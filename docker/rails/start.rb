#!/usr/bin/env ruby

# We bundle install on build.
# We bundle install on start too in development.
if [nil, "development"].include?(ENV["RAILS_ENV"])
  system "bundle install"
end

system "wait-for-it postgres:5432"
system "wait-for-it redis:6379"

system "bundle exec rake db:create"
system "bundle exec rake db:migrate"

system "rm tmp/pids/server.pid > /dev/null 2>&1"

exec <<~HEREDOC
  bundle exec \
    rails server \
      -p 3000 \
      -b '0.0.0.0'
HEREDOC
