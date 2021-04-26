User.create! do |u|
  u.email = 'admin@sac.com'
  u.password = 'passwordpassword'
  u.hq_role = true
  u.name = 'Admin'
  u.office_symbol = 'HQ'
  u.work_phone_number = 'xxx-xxxx'
end 
User.create! do |u|
  u.office_id = 1
  u.email = 'user@sac.com'
  u.password = 'passwordpassword'
  u.name = 'User'
  u.office_symbol = 'office_sym'
  u.work_phone_number = 'xxx-xxxx'
end
User.create! do |u|
  u.office_id = 1
  u.email = 'sfs@sac.com'
  u.password = 'passwordpassword'
  u.installation = 'Barksdale'
  u.wing = '2nd Bomb Wing'
  u.grp = 'MSG'
  u.unit = '2 SFS'
  u.name = 'SFS RA'
  u.office_symbol = '2 SFS/RA'
  u.work_phone_number = 'xxx-xxxx'
end
User.create! do |u|
  u.office_id = 1
  u.email = 'msg_ra@sac.com'
  u.password = 'passwordpassword'
  u.installation = 'Barksdale'
  u.wing = '2nd Bomb Wing'
  u.grp = 'MSG'
  u.name = 'MSG RA'
  u.office_symbol = 'MSG/RA'
  u.work_phone_number = 'xxx-xxxx'
end
User.create! do |u|
  u.office_id = 1
  u.email = 'fma@sac.com'
  u.password = 'passwordpassword'
  u.installation = 'Barksdale'
  u.wing = '2nd Bomb Wing'
  u.fma_role = true
  u.name = 'FMA Office Tech'
  u.office_symbol = '2 CPTS/FMA'
  u.work_phone_number = 'xxx-xxxx'
end
