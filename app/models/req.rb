require 'date'

class Req < ApplicationRecord
  scope :mine, ->(user) { 
    return where(unit: user.unit) if user.unit
    return where(group: user.unit) if user.group
    all
  }

end
