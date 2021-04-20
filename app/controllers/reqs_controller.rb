require 'date'

class ReqsController < ApplicationController
  #load_and_authorize_resource
  before_action :set_req, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  #skip_before_action :authenticate_user!, only: [ :index ]

  # Set up helper methods
  helper_method :sort_column, :sort_direction

  # GET /reqs or /reqs.json
  def index
      @reqs = Req.mine(current_user)
      #@search = Req.ransack(params[:q])
      #@reqs = @search.result
  end

  # GET /reqs/1 or /reqs/1.json
  def show
  end

  # GET /reqs/new
  def new
    @req = Req.new
    @req.questions(current_user.office).each do |q|
      @req.answers.build(question_id: q.id)
    end
  end

  # GET /reqs/1/edit
  def edit
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
      etext-nord0lse
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
        req = Req.new
        req.requirement_number = row["Requirement Number"]
        req.status = row["Status"]
        req.operating_entity = row["Operating Entity"]
        req.group = row["Group"]
        req.unit = row["Unit/ Directorate"]
        req.owner_ranking = row["Owner Ranking"]
        req.title = row["Title"]
        req.justification = row["Justification"]
        req.impact_if_not_funded = row["Impact if not Funded"]
        #req.priority_level = row["Priority Level (0 1 2 A E)"]
        req.pec = row["PEC"]
        req.ba = row["BA"]
        req.sag = row["SAG"]
        req.panel = row["Panel"]
        req.eeic = row["EEIC"]
        req.object_class = row["Object Class"]
        req.esp = row["ESP"]
        req.cost_center = row["Cost Center"]
        req.aai = row["AAI"]
        req.requirement_total = row[" Requirement Total"]
        req.wing_funded_total = row[" Wing Funded Total"]
        req.unfunded_total_by_wing = row[" Unfunded Total based on Wing Funded"]
        req.pem_remarks = row["PEM Remarks"]
        req.hq_fma_remarks = row["HQ FMA Remarks"]
        req.ep_funded_amount = row[" EP Funded Amount"]       
        req.unfunded_amount_by_ep = row[" Unfunded Amount Based on EP Funding"]
        req.need_by_date = row[" Need By Date"]
        req.method_of_purchase = row["Method of Purchase"]
        req.is_recurring = row["Is Recurring"]
        req.final_fy = row["Final FY"]
        req.is_civ_pay = row["Is Civ Pay"]
        req.contract_number = row["Contract Number"]
        req.pop_start_date = row["PoP Start Date"]
        req.pop_end_date = row["PoP End Date"]
        req.created_by_org = row["Created By Org"]
        req.reviewed_by = row["AFGSC/FMAO Reveiwed By"]
        
        req.office = current_user.office

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
      params.require(:req).permit(:requirement_number,
                                  :status,
                                  :operating_entity,
                                  :group,
                                  :unit,
                                  :owner_ranking,
                                  :title,
                                  :justification,
                                  :impact_if_not_funded,
                                  :priority_level,
                                  :pec,
                                  :ba,
                                  :sag,
                                  :panel ,
                                  :eeic,
                                  :object_class,
                                  :esp,
                                  :cost_center,
                                  :aai,
                                  :requirement_total,
                                  :wing_funded_total,
                                  :unfunded_total_by_wing,
                                  :pem_remarks,
                                  :hq_fma_remarks,
                                  :ep_funded_amount,
                                  :unfunded_amount_by_ep,
                                  :need_by_date,
                                  :method_of_purchase,
                                  :is_recurring,
                                  :final_fy,
                                  :is_civ_pay,
                                  :contract_number,
                                  :pop_start_date,
                                  :pop_end_date,
                                  :created_by_org,
                                  :reviewed_by ,
                                  :upload, 
                                  answers_attributes: [
                                    :question_id,
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
