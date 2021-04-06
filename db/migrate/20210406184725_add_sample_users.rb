class AddSampleUsers < ActiveRecord::Migration[6.1]
  def change
    User.create! do |u|
      u.email = 'admin@sac.com'
      u.password = 'passwordpassword'
      u.hq_role = true
    end 
    User.create! do |u|
      u.email = 'user@sac.com'
      u.password = 'passwordpassword'
    end
    User.create! do |u|
      u.email = 'sfs@sac.com'
      u.password = 'passwordpassword'
      u.installation = 'Barksdale'
      u.wing = '2nd Bomb Wing'
      u.group = 'MSG'
      u.unit = '2 SFS'
    end
    User.create! do |u|
      u.email = 'msg_ra@sac.com'
      u.password = 'passwordpassword'
      u.installation = 'Barksdale'
      u.wing = '2nd Bomb Wing'
      u.group = 'MSG'
    end
    User.create! do |u|
      u.email = 'fma@sac.com'
      u.password = 'passwordpassword'
      u.installation = 'Barksdale'
      u.wing = '2nd Bomb Wing'
      u.fma_role = true
    end
  end
end
