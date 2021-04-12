class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|

      t.text :question
      t.integer :office_id

      t.timestamps
    end
    create_table :answers do |t|
      
      t.integer :question_id
      t.integer :req_id 
      t.text :answer
    end

  end
end
