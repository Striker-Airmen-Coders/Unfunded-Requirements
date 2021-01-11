class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  VALID_ROLES = [nil, "admin"]
  validates_inclusion_of :role, in: VALID_ROLES
end
