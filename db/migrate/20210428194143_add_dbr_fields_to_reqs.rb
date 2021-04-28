class AddDbrFieldsToReqs < ActiveRecord::Migration[6.1]
  def change
   add_colummn :reqs, :req_number, :string
   add_colummn :reqs, :status, :string
   add_colummn :reqs, :owner_ranking, :integer
   add_colummn :reqs, :priority_level, :string
   add_colummn :reqs, :budget_authority, :integer
   add_colummn :reqs, :sag, :string
   add_colummn :reqs, :panel, :string
   add_colummn :reqs, :object_class, :string
   add_colummn :reqs, :esp, :string
   add_colummn :reqs, :aai, :string
   add_colummn :reqs, :total_minus_wingfunded, :integer
   add_colummn :reqs, :ep_funded, :integer
   add_colummn :reqs, :total_minus_epfunded, :integer
   add_colummn :reqs, :needby_date, :datetime
   add_colummn :reqs, :final_FY, :string
   add_colummn :reqs, :contract_number, :string
   add_colummn :reqs, :pop_start_date, :datetime
   add_colummn :reqs, :create_by_org, :string
   add_colummn :reqs, :reviewed_by, :string
   #If headquarters users have an account, convert these to foreign keys and add 'Reviewer' type to models
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   remove_colummn :reqs, 
   add_colummn :reqs, 
   add_colummn :reqs, 
   add_colummn :reqs, 
   add_colummn :reqs, 
   add_colummn :reqs, 
  end
end
