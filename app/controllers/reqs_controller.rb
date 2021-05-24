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
      @reqs = @search.result#.mine(current_user)
                            # I don't understand scopes well enough to be sure this works, the scope MIGHT understand hq seeing all reqs but idk
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

  def tagged
    #I think this will get all reqs rather than scoping as desired.
    #When it misbehaves, this is the problem
    #try Req.mine(current_user) instead of req, look to the index as well
    if params[:tag].present?
      @reqs = Req.tagged_with(params[:tag])
    else
      @reqs = Req.all
    end
  end

  def import
    CSV.foreach(params['upload'].to_path, headers: true, encoding: 'ISO-8859-1') do |row| 

      req = Req.find_or_initialize_by(dbr_id: row["Requirement Number"].last(6).to_i)
          #this actually needs to grab the whole thing, but I don't know
          #how to initialize a value with this pattern:
          #2022-F6790-000001 which is Fiscal Year, Operating Entity, ID num (diff OEs all start from 0 and increment)

      req.req_number = row["Requirement Number"]
      req.fiscal_year = row["Requirement Number"].first(4).to_i
      req.create_by_org = row["Created By"]
      req.status = row["Status"]
      req.operating_entity = row["OE"]
      req.title = row["Title"]
      req.pec = row["PEC"]
      req.sag = row["SAG"]
      req.panel = row["Panel"]
      req.majcom_panel = row["MAJCOM Panel"]
      req.majcom_directorate = row["MAJCOM Directorate"]
      req.eeic = row["EEIC"]
      req.object_class = row["OSC"]
      req.esp = row["ESP"]
      req.rccc = row["Cost Center"]
      req.aai = row["AAI"]
      req.req_total = row["Requirement Amount"].gsub(/,/, '').to_i #comma remove on nums
      req.funding_secured = row["Funded Amount"]
      req.authorized_amount = row["Authorized Amount"]
      req.owner_priority = row["Owner Priority"]
      req.grp = row["Group"] #acronym logic here? Lookup/translate not replace
      req.unit = row["Unit"]
      req.final_FY = row["Final FY"]
      req.pop_start_date = row["PoP Start Date"]
      req.pop_end_date = row["PoP End Date"]

      #These fields aren't on the most recent export, but could be useful
      req.method_of_purchase = row["Method of Purchase"]
      req.priority_level = row["Priority Level (0, 1, 2, A, E)"]
      req.budget_authority = row["BA"]
      req.needby_date = row["Need By Date"]
      req.contract_number = row["Contract Number"]
      req.reviewed_by = row["AFGSC/FMAO Reviewed By"]

      # uncomment if the user uploading is fma_role = true. 
      # comment if HQ is uploading it.
      # It is conceivable that you'd later add a data field 
      # to the csv that has the correct office, then you'd remove this.
      req.office = current_user.office
      
      # you would not want to do what is described above for this field here.
      req.user = current_user

      #possibly add line item remark idk there's nothing in the sample data
      req.add_answer(:justification, row["Justification"])
      req.add_answer(:impact, row["Impact if not Funded"])
      #req.add_answer(:pem_remarks, row["PEM Remarks"])
      req.add_answer(:hq_remarks, row["HQ FMA Remarks"])
      req.add_answer(:is_recurring, to_bool(row["Recurring"]))
      req.add_answer(:is_civpay, to_bool(row["Civ Pay"]))
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
      params.require(:req).permit(:dbr_id,
                                  :req_number, 
                                  :fiscal_year, 
                                  :create_by_org, 
                                  :status, 
                                  :operating_entity, 
                                  :title, 
                                  :pec, 
                                  :sag, 
                                  :panel, 
                                  :majcom_panel, 
                                  :majcom_directorate, 
                                  :eeic, 
                                  :object_class, 
                                  :esp, 
                                  :rccc, 
                                  :aai, 
                                  :req_total, 
                                  :funding_secured, 
                                  :authorized_amount, 
                                  :owner_priority, 
                                  :grp, 
                                  :unit, 
                                  :final_FY, 
                                  :pop_start_date, 
                                  :pop_end_date, 
                                  :method_of_purchase, 
                                  :priority_level, 
                                  :budget_authority, 
                                  :needby_date, 
                                  :contract_number, 
                                  :reviewed_by, 
                                  :point_of_contact,
                                  :installation,
                                  :tag_list,
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
