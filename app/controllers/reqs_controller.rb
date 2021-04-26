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
    if current_user.hq_role == true
      @reqs = Req.all
    else
      @reqs = Req.mine(current_user)
      @search = Req.ransack(params[:q])
      @reqs = @search.result
    end
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
      req = Req.find_or_initialize_by(dbr_id: row["ID"])

      req.priority = row["Priority"]
      req.start_time = row["Start time"]
      req.completion_time = row["Completion time"]
      req.email = row["Email"]
      req.name = row["Name"]
      req.office_symbol = row["Your Office Symbol"]
      req.work_phone_number = row["Your Work Phone Number"]
      req.title = row["Title"]
      req.req_total = row["Dollar amount of requirement (total)"]
      req.funding_secured = row["How much funding has been secured so far?"]
      req.operating_entity = row["18SA or F6790?"]
      req.group = row["Group"]
      req.unit = row["Unit"]
      req.pec = row["PEC"]
      req.rccc = row["RCCC"]
      req.eeic = row["EEIC"]
      req.method_of_purchase = row["Method of Purchase"]
      req.point_of_contact = row["Who is the point of contact in your unit to whom questions about this project could be answered?"]

      req.add_answer(:pitch, row["Pitch"])
      req.add_answer(:problem, row["What is the problem you trying to solve?"])
      req.add_answer(:solution, row["What is the solution to your problem?"])
      req.add_answer(:solution_progress, row["Where are you at on implementing your solution?"])
      req.add_answer(:mission_impact, row["What is the mission impact of your problem?"])
      req.add_answer(:attempted_self_help, row["Have you attempted to 'self-help' your problem?"])
      req.add_answer(:current_working_solution, row["How are you currently dealing with your problem? How are your resources/time being spent now?"])
      req.add_answer(:investment_vs_workaround, row["Why should money be invested in your project, rather than a workaround?"])

      # uncomment if the user uploading is fma_role = true
      req.office = current_user.office
      req.user = current_user
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
                                  :group, 
                                  :unit, 
                                  :pec,
                                  :rccc,
                                  :eeic,
                                  :point_of_contact, 
                                  :priority,
                                  :dbr_id,
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
