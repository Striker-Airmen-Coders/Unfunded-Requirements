# README
To make me work after cloning,

$ bundle install

$ yarn install

$ rails db:migrate

If the page renders, but there's nothing in there

$ rails db:seed

To add a user:

$ rails c

$> User.create email: 'sample.email@email.com', password: 'sample password', hq_role: true

hq_role will make this user an administrator and is a bool; leaving this off will make the user a user_role

Help, it hangs on webpacker stuff:

bundle exec rails webpacker:install

current users; passwords are all 'passwordpassword'
*admin@sac.com
*user@sac.com
*sfs@sac.com
*msg_ra@sac.com
*fma@sac.con
