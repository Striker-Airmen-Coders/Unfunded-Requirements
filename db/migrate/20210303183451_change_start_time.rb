class ChangeStartTime < ActiveRecord::Migration[6.1]
  def change
    change_column :reqs, :start_time, :datetime
    change_column :reqs, :completion_time, :datetime
  end
end
