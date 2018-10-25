class AvancementsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_avancement, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # GET /avancements
  # GET /avancements.json
  def index
    @avancements = Avancement.all
  end

  # GET /avancements/1
  # GET /avancements/1.json
  def show
  end

  # GET /avancements/new
  def new
    @avancement = Avancement.new
  end

  # GET /avancements/1/edit
  def edit
  end

  # POST /avancements
  # POST /avancements.json
  def create
    @avancement = Avancement.new(avancement_params)

    respond_to do |format|
      if @avancement.save
        format.html { redirect_to @avancement, notice: 'Avancement was successfully created.' }
        format.json { render :show, status: :created, location: @avancement }
      else
        format.html { render :new }
        format.json { render json: @avancement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avancements/1
  # PATCH/PUT /avancements/1.json
  def update
    respond_to do |format|
      if @avancement.update(avancement_params)
        format.html { redirect_to @avancement, notice: 'Avancement was successfully updated.' }
        format.json { render :show, status: :ok, location: @avancement }
      else
        format.html { render :edit }
        format.json { render json: @avancement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avancements/1
  # DELETE /avancements/1.json
  def destroy
    @avancement.destroy
    respond_to do |format|
      format.html { redirect_to avancements_url, notice: 'Avancement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avancement
      @avancement = Avancement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avancement_params
      params.require(:avancement).permit(:matricule_employe, :date_avancement)
    end
end
