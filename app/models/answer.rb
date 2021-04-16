class Answer < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :question
  belongs_to :req

  delegate :type, to: :question, allow_nil: true

  def type?(v)
    type.to_s == v.to_s
  end

  def value
    self.send(type)
  end
end