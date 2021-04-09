class AddUserIdToReqs < ActiveRecord::Migration[6.1]
  def change
    change_table :reqs do |t|
      t.integer :user_id
    end
  end
end
