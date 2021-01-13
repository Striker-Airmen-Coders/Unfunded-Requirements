
if !([ENV['RAILS_ENV'], Rails&.env] == ["test", "test"])
  magenta="\e[35m"
  end_color="\e[0m"
  puts(<<~EOS)
    #{magenta}
    Tests are starting in the wrong Rails environment!
    Current ENV['RAILS_ENV']:
      #{ENV['RAILS_ENV']}
    If you ran `rake test` instead of `rails test`, run `rails test`.
      `rails test` should set the environment automatically.
    If that doesn't work,
      try running `RAILS_ENV=test rails test` or `RAILS_ENV=test rake test`
    #{end_color}
  EOS
  exit 1
end

require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
