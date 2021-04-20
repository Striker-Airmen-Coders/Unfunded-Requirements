class CreateReqs < ActiveRecord::Migration[6.1]
  def change
    create_table :reqs do |t|
      t.string :requirement_number
      t.string :status
      t.string :operating_entity
      t.string :group
      t.string :unit
      t.integer :owner_ranking
      t.string :title
      t.text :justification
      t.text :impact_if_not_funded
      t.string :priority_level
      t.string :pec
      t.string :ba
      t.string :sag
      t.string :panel 
      t.string :eeic
      t.string :object_class
      t.string :esp
      t.string :cost_center
      t.string :aai
      t.decimal :requirement_total
      t.decimal :wing_funded_total
      t.decimal :unfunded_total_by_wing
      t.text :pem_remarks
      t.text :hq_fma_remarks
      t.decimal :ep_funded_amount
      t.decimal :unfunded_amount_by_ep
      t.date :need_by_date
      t.string :method_of_purchase
      t.boolean :is_recurring
      t.string :final_fy
      t.boolean :is_civ_pay
      t.string :contract_number
      t.date :pop_start_date
      t.date :pop_end_date
      t.string :created_by_org
      t.string :reviewed_by 

      t.timestamps
    end
  end
end
