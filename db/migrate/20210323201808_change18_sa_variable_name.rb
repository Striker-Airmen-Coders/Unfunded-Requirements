class Change18SaVariableName < ActiveRecord::Migration[6.1]
  def change
    rename_column :reqs, :is_18SA_or_F6790?, :is_18SA_or_F6790
  end
end
