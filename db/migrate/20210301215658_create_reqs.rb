class CreateReqs < ActiveRecord::Migration[6.1]
  def change
    create_table :reqs do |t|
      t.datetime :start_time
      t.datetime :completion_time
      t.string :name
      t.string :email
      t.string :title
      t.string :office_symbol
      t.string :work_phone_number
      t.string :is_18SA_or_F6790
      t.string :group
      t.string :unit
      t.string :pec
      t.string :rccc
      t.string :eeic
      t.string :method_of_purchase
      t.string :point_of_contact
      t.decimal :req_total
      t.decimal :funding_secured
      t.text :pitch
      t.text :problem
      t.text :solution
      t.text :solution_progress
      t.text :mission_impact
      t.text :current_working_solution
      t.text :investment_vs_workaround
      t.boolean :attempted_self_help
      t.string :installation, default: 'Barksdale'   

      t.timestamps
    end
  end
end
