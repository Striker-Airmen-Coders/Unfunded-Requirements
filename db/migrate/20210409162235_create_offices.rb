class CreateOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :offices do |t|
      t.string :name
      t.timestamps
    end
    change_table :users do |t|
      t.belongs_to :office
    end
    change_table :reqs do |t|
      t.belongs_to :office
    end
  end
end
