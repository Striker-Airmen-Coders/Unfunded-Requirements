class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  VALID_ROLES = [nil, "admin"]
  validates_inclusion_of :role, in: VALID_ROLES
end
