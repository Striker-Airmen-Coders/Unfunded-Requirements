class AddDbrFieldsToReqs < ActiveRecord::Migration[6.1]
  def change
   add_column :reqs, :req_number, :string
   add_column :reqs, :status, :string
   add_column :reqs, :owner_ranking, :integer
   add_column :reqs, :priority_level, :string
   add_column :reqs, :budget_authority, :integer
   add_column :reqs, :sag, :string
   add_column :reqs, :panel, :string
   add_column :reqs, :object_class, :string
   add_column :reqs, :esp, :string
   add_column :reqs, :aai, :string
   add_column :reqs, :total_minus_wingfunded, :integer
   add_column :reqs, :ep_funded, :integer
   add_column :reqs, :total_minus_epfunded, :integer
   add_column :reqs, :needby_date, :datetime
   add_column :reqs, :final_FY, :string
   add_column :reqs, :contract_number, :string
   add_column :reqs, :pop_start_date, :datetime
   add_column :reqs, :create_by_org, :string
   add_column :reqs, :reviewed_by, :string
   #If headquarters users have an account, convert these to foreign keys and add 'Reviewer' type to models

   remove_column :reqs, :dbr_id
   remove_column :reqs, :start_time
   remove_column :reqs, :completion_time
   remove_column :reqs, :email
   remove_column :reqs, :office_symbol
   remove_column :reqs, :work_phone_number
  end
end
