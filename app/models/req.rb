require 'date'

class Req < ApplicationRecord
  has_paper_trail
  belongs_to :office
  belongs_to :user
  has_many :answers
  acts_as_taggable_on :tags

  accepts_nested_attributes_for :answers

  validates :office, presence: true
  validates :user, presence: true

  delegate :email, :name, :office_symbol, :work_phone_number,
    to: :user, prefix: true

  scope :mine, ->(user) { 
    return where(unit: user.unit, office: user.office) if user.unit
    return where(grp: user.grp, office: user.office) if user.grp
    where(office: user.office)
  }

  def questions
    Question.where office_id: [nil, office_id]
  end

  def add_answer(key, value)
    question = Question.find_by(key: key)
    answers << Answer.create(question: question, text: value)

  end

  def answer_for(key)
    answers.joins(:question).find_by(question: { key: key }).try(:value)
  end
end
