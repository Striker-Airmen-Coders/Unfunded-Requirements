class Question < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :office, optional: true
  has_many :answers

  validates :type,
    inclusion: {
      in: %w(text number date boolean),
      message: "%{value} is not a valid type"
    }
  validates :key,
    uniqueness: true,
    unless: -> { key.blank? }
end