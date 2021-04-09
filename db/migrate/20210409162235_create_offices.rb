class CreateOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :offices do |t|
      t.string :name
      t.timestamps
    end
    change_table :users do |t|
      t.integer :office_id
    end
    change_table :reqs do |t|
      t.integer :office_id
    end
  end
end
