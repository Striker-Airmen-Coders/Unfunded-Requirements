class AddLineageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :installation, :string
    add_column :users, :wing, :string
    add_column :users, :group, :string
    add_column :users, :unit, :string
  end
end
