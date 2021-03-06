require_relative "20210227184433_create_reqs"

class AddRemainingFieldsToTReqs < ActiveRecord::Migration[6.1]
  def change
    revert CreateReqs

    create_table(:reqs) do |t|
      t.date :start_time
      t.date :completion_time
      t.string :name
      t.string :email
      t.string :title
      t.string :office_symbol
      t.string :work_phone_number
      t.string :is_18SA_or_F6790?
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
    end
  end
end
