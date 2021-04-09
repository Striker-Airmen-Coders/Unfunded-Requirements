require 'date'

class Req < ApplicationRecord
  belongs_to :office
  belongs_to :user

  validates :office, presence: true
  validates :user, presence: true

  delegate :email, :name, :office_symbol, :work_phone_number,
    to: :user, prefix: true

  scope :mine, ->(user) { 
    return where(unit: user.unit, office: user.office) if user.unit
    return where(group: user.group, office: user.office) if user.group
    where(office: user.office)
  }


end
