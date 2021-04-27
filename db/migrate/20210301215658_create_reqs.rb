class CreateReqs < ActiveRecord::Migration[6.1]
  def change
    create_table :reqs do |t|
      t.integer :dbr_id
      t.datetime :start_time
      t.datetime :completion_time
      t.string :name
      t.string :email
      t.string :title
      t.string :office_symbol
      t.string :work_phone_number
      t.string :operating_entity
      t.string :grp
      t.string :unit
      t.string :pec
      t.string :rccc
      t.string :eeic
      t.string :method_of_purchase
      t.string :point_of_contact
      t.decimal :req_total
      t.decimal :funding_secured
      t.string :installation, default: 'Barksdale'   
      t.string :office, default: 'Barksdale'
      t.integer :priority
      t.timestamps

      #these fields are here as an example of what DBR would need
#      t.boolean :is_recurring
#      t.string :final_fy
#      t.boolean :is_civ_pay
#      t.string :contract_number
#      t.date :pop_start_date
#      t.date :pop_end_date
#      t.string :created_by_org
#      t.string :reviewed_by
#      t.string :object_class
#      t.string :esp
#      t.string :aai
#      t.decimal :requirement_total
#      t.decimal :wing_funded_total
#      t.decimal :unfunded_total_by_wing
#      t.text :pem_remarks
#      t.text :hq_fma_remarks
#      t.decimal :ep_funded_amount
#      t.decimal :unfunded_amount_by_ep
#      t.date :need_by_date
#      t.string :ba
#      t.string :sag
#      t.string :panel 
#      t.string :priority_level
#      t.integer :owner_ranking
#      t.string :requirement_number
#      t.string :status


    end
  end
end
