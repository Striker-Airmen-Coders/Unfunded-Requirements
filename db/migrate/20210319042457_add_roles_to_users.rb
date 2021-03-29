class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :hq_role, :boolean, default: false
    add_column :users, :fma_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
  end
end
