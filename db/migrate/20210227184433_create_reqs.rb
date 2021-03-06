class CreateReqs < ActiveRecord::Migration[6.1]
  def change
    create_table :reqs do |t|
      t.string :name
      t.string :title
      t.float :cost
      t.string :group
      t.string :unit
      t.string :pec
      t.string :mop
      t.string :poc

      t.timestamps
    end
  end
end
