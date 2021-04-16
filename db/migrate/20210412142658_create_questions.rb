class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.belongs_to :office
      t.string :key
      t.string :type, default: :text
      t.text :text

      t.timestamps
    end
    create_table :answers do |t|
      t.belongs_to :question
      t.belongs_to :req
      t.string :text
      t.integer :number
      t.date :date
      t.boolean :boolean

      t.timestamps
    end

  end
end
