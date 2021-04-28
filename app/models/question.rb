class Question < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :office, optional: true
  has_many :answers

  validates :type,
    presence: true,
    inclusion: {
      in: %w(text number date boolean),
      message: "%{value} is not a valid type"
    }

  validates :text, presence: true

  validates :key,
    uniqueness: true,
    unless: -> { key.blank? }
  
  def answer_for(req)
    answers.where(req: req).first
  end


end
