class ReqsController < ApplicationController
  before_action :set_req, only: %i[ show edit update destroy ]

  # GET /reqs or /reqs.json
  def index
    @reqs = Req.all
  end

  # GET /reqs/1 or /reqs/1.json
  def show
  end

  # GET /reqs/new
  def new
    @req = Req.new
  end

  # GET /reqs/1/edit
  def edit
  end

  # POST /reqs or /reqs.json
  def create
    @req = Req.new(req_params)

    respond_to do |format|
      if @req.save
        format.html { redirect_to @req, notice: "Req was successfully created." }
        format.json { render :show, status: :created, location: @req }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reqs/1 or /reqs/1.json
  def update
    respond_to do |format|
      if @req.update(req_params)
        format.html { redirect_to @req, notice: "Req was successfully updated." }
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
      format.html { redirect_to reqs_url, notice: "Req was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_req
      @req = Req.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def req_params
      params.require(:req).permit(:name, :title, :cost, :group, :unit, :pec, :mop, :poc)
    end
end
