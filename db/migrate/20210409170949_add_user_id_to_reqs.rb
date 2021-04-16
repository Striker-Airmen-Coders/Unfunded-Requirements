class AddUserIdToReqs < ActiveRecord::Migration[6.1]
  def change
    change_table :reqs do |t|
      t.belongs_to :user
    end
  end
end
