class Question < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :office, optional: true
  

end

