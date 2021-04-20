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

      req.start_time = row[1]
      req.completion_time = row[2]
      req.name = row[3]
      req.email = row[4]
      req.title = row[5]
      req.office_symbol = row[6]
      req.work_phone_number = row[7]
      req.is_18SA_or_F6790 = row[8]
      req.group = row[9]
      req.unit = row[10]
      req.pec = row[11]
      req.rccc = row[12]
      req.eeic = row[13]
      req.method_of_purchase = row[14]
      req.point_of_contact = row[15]
      req.req_total = row[16]
      req.funding_secured = row[17]
      req.pitch = row[18]
      req.problem = row[19]
      req.solution = row[20]
      req.solution_progress = row[21]
      req.mission_impact = row[22]
      req.current_working_solution = row[23]
      req.investment_vs_workaround = row[24]
      req.attempted_self_help = row[25]

      # uncomment if the user uploading is fma_role = true
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
                                  :is_18SA_or_F6790, 
                                  :group, 
                                  :unit, 
                                  :pec,
                                  :rccc,
                                  :eeic,
                                  :point_of_contact, 
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
