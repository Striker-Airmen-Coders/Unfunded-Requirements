class AddInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :name
      t.string :office_symbol
      t.string :work_phone_number
    end
  end
end
