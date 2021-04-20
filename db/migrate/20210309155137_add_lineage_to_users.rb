class AddLineageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :installation, :string
    add_column :users, :wing, :string
    add_column :users, :group, :string
    add_column :users, :unit, :string
    add_column :users, :hq_role, :boolean, default: false
    add_column :users, :fma_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
    add_column :users, :name
    add_column :users, :office_symbol
    add_column :users, :work_phone_number
  end
end
