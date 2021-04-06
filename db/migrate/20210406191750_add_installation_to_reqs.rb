class AddInstallationToReqs < ActiveRecord::Migration[6.1]
  def change
    add_column :reqs, :installation, :string, default: 'Barksdale'
  end
end
