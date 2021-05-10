require 'date'

class ReqsController < ApplicationController
  before_action :set_req, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # Set up helper methods
  helper_method :sort_column, :sort_direction

  # GET /reqs or /reqs.json
  def index
    if current_user.hq_role == true
      @reqs = Req.all
      @search = Req.ransack(params[:q])
      @reqs = @search.result
    else
      @search = Req.ransack(params[:q])
      @reqs = @search.result
      @reqs = @reqs.mine(current_user)
    end
  end

  # GET /reqs/1 or /reqs/1.json
  def show
  end

  # GET /reqs/new
  def new
    @req = Req.new
    @req.office = current_user.office
    @req.questions.each do |q|
      @req.answers.build(question_id: q.id)
    end

    #It's possible I will need to define how to build the requirement number here for the find or create by to function properly
  end

  # GET /reqs/1/edit
  def edit
    @req.questions.each do |q|
      q.answer_for(@req) || @req.answers.build(question_id: q.id)
    end
  end

  # POST /reqs or /reqs.json
  def create
    @req = Req.new(req_params)
    @req.office = current_user.office
    @req.user = current_user


    respond_to do |format|
      if @req.save
        flash[:notice] = "Your requirement has been saved"
        format.html { redirect_to @req }
        format.json { render :show, status: :created, location: @req }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reqs/1 or /reqs/1.json
  def update
    respond_to do |format|
      if @req.update(req_params)
        flash[:notice] = "Your requirement has been saved"
        format.html { redirect_to @req }
        format.json { render :show, status: :ok, location: @req }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @req.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reqs/1 or /reqs/1.json
  def destroy
    @req.destroy
    respond_to do |format|
      flash[:notice] = "Req was successfully destroyed."
      format.html { redirect_to reqs_url }
      format.json { head :no_content }
    end
  end

  def import
    CSV.foreach(params['upload'].to_path, headers: true, encoding: 'ISO-8859-1') do |row| 

      req = Req.create #initialize_by(req_id)


      req.req_number = row["Requirement Number"]
#      req.dbr_id = row["Requirement Number"].last(6).to_i 
      req.fiscal_year = row["Requirement Number"].first(4).to_i
      req.priority = row["Priority"]
      req.title = row["Title"]
      req.req_total = row["Requirement Total"].gsub(/,/, '').to_i #comma remove on nums
      req.funding_secured = row["Wing Funded Total"]
      req.operating_entity = row["Operating Entity"]
      req.grp = row["Group"]
      req.unit = row["Unit/ Directorate"]
      req.pec = row["PEC"]
      req.rccc = row["Cost Center"]
      req.eeic = row["EEIC"]
      req.object_class = row["Object Class"]
      req.esp = row["ESP"]
      req.aai = row["AAI"]
      req.method_of_purchase = row["Method of Purchase"]

      req.status = row["Status"]
      req.owner_ranking = row["Owner Ranking"]
      req.priority_level = row["Priority Level (0, 1, 2, A, E)"]
      req.budget_authority = row["BA"]
      req.sag = row["SAG"]
      req.panel = row["Panel"]
      req.total_minus_wingfunded = row[" Unfunded Total based on Wing Funded"]
      req.ep_funded = row[" EP Funded Amount"]
      req.total_minus_epfunded = row[" Unfunded Amount Based on EP Funding"]
      req.needby_date = row[" Need By Date"]
      req.final_FY = row["Final FY"]
      req.contract_number = row["Contract Number"]
      req.pop_start_date = row["PoP Start Date"]
      req.create_by_org = row["PoP End Date"]
      req.reviewed_by = row["Created By Org"]
      req.reviewed_by = row["AFGSC/FMAO Reveiwed By"]


      # uncomment if the user uploading is fma_role = true. 
      # It is conceivable that you'd later add a data field 
      # to the csv that has the correct office, then you'd remove this.
      req.office = current_user.office
      
      # you would not want to do what is described above for this field here.
      req.user = current_user

      req.add_answer(:justification, row["Justification"])
      req.add_answer(:impact, row["Impact if not Funded"])
      req.add_answer(:pem_remarks, row["PEM Remarks"])
      req.add_answer(:hq_remarks, row["HQ FMA Remarks"])
      req.add_answer(:is_recurring, to_bool(row["Is Recurring"]))
      req.add_answer(:is_civpay, to_bool(row["Is Civ Pay"]))
      req.save


    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_req
      @req = Req.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def req_params
      params.require(:req).permit(:name, 
                                  :title,
                                  :email,
                                  :office_symbol,
                                  :work_phone_number,
                                  :req_total,
                                  :funding_secured,
                                  :start_time, 
                                  :completion_time,
                                  :method_of_purchase,
                                  :pitch,
                                  :problem,
                                  :solution,
                                  :solution_progress,
                                  :mission_impact,
                                  :attempted_self_help,
                                  :current_working_solution,
                                  :investment_vs_workaround,
                                  :operating_entity, 
                                  :grp, 
                                  :unit, 
                                  :pec,
                                  :rccc,
                                  :eeic,
                                  :priority,
                                  :req_number,
                                  :status,
                                  :owner_ranking,
                                  :priority_level,
                                  :budget_authority,
                                  :sag,
                                  :panel,
                                  :object_class,
                                  :esp,
                                  :aai,
                                  :total_minus_wingfunded,
                                  :ep_funded,
                                  :total_minus_epfunded,
                                  :needby_date,
                                  :final_FY,
                                  :contract_number,
                                  :pop_start_date,
                                  :create_by_org,
                                  :reviewed_by,
                                  answers_attributes: [
                                    :question_id,
                                    :id,
                                    :text,
                                    :boolean,
                                    :answer
                                  ]
                                  )
    end

    # Sort column helper method
    def sort_column
      Req.column_names.include?(params[:sort]) ? params[:sort] : "req_total"
    end

    # Sort direction helper method
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
