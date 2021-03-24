# README
To make me work after cloning,

$ bundle install

$ yarn install

$ rails db:migrate

$ rails db:seed

To add a user:

$ rails c

$> User.create email: 'sample.email@email.com', password: 'sample password', hq_role: true

hq_role will make this user an administrator and is a bool; leaving this off will make the user a user_role
