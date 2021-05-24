class AddObjectChangesColumnToVersions < ActiveRecord::Migration[6.1]
  def self.up
    add_column :versions, :object_changes, :text 
  end

  def self.down
    remove_column :versions, :object_changes
  end
end
