class CreateReqs < ActiveRecord::Migration[6.1]
  def change
    create_table :reqs do |t|
      t.integer :dbr_id
      t.string :req_number 
      t.integer :fiscal_year 
      t.string :create_by_org 
      t.string :status 
      t.string :operating_entity 
      t.string :title 
      t.string :pec 
      t.string :sag 
      t.string :panel 
      t.string :majcom_panel 
      t.string :majcom_directorate 
      t.string :eeic 
      t.string :object_class 
      t.string :esp 
      t.string :rccc 
      t.string :aai 
      t.integer :req_total 
      t.integer :funding_secured 
      t.integer :authorized_amount 
      t.integer :owner_priority 
      t.string :grp 
      t.string :unit 
      t.integer :final_FY 
      t.datetime :pop_start_date 
      t.datetime :pop_end_date 
      t.string :method_of_purchase 
      t.string :priority_level 
      t.string :budget_authority 
      t.datetime :needby_date 
      t.string :contract_number 
      t.string :reviewed_by 

      t.timestamps
    end
  end
end
