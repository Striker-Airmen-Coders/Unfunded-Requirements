# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'securerandom'

YELLOW="\e[33m"
GREEN="\e[32m"
MAGENTA="\e[35m"
TEAL="\e[36m"
END_COLOR="\e[0m"

development_user_email = "example_user@rubyshore.com"

def generate_password(for_what)
  password = SecureRandom.base64(8)

  puts "#{TEAL}Generated password for #{for_what}:#{END_COLOR}"
  puts ["\t", YELLOW, password, END_COLOR].join

  return password
end

development_user = User.create(
  email: development_user_email,
  password: generate_password(development_user_email),
)
puts "#{TEAL}Save this password so you can use it later.#{END_COLOR}"
puts "If you forget this password or want to change it:"
puts "\t$ bundle exec rails console"
puts "\t> user = User.find_by(email: '#{development_user_email}')"
puts "\t> user.password = \"some new really secure password (that isn't this one)\""
puts "\t> user.valid? || user.errors.full_messages"
puts "\t> user.save!"
