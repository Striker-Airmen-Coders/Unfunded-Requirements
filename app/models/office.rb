class Office < ApplicationRecord
    has_many :users
    has_many :reqs
end
