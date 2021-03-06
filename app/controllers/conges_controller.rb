class CongesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_conge, only: [:show, :edit, :update, :destroy]
	layout 'dashboard'
  # GET /conges
  # GET /conges.json
  def index
    @conges = Conge.all
  end

  # GET /conges/1
  # GET /conges/1.json
  def show
  end

  # GET /conges/new
  def new
    @type_conges = TypeConge.all
    @conge = Conge.new

  end

  # GET /conges/1/edit
  def edit
    @type_conges = TypeConge.all
  end

  # POST /conges
  # POST /conges.json
  def create
    @conge = current_user.conges.build(conge_params)

    respond_to do |format|
      if @conge.save
        @conges = Conge.all
        format.html { redirect_to @conge, notice: 'Conge was successfully created.' }
        format.json { render :show, status: :created, location: @conge }
        format.js
      else
        format.html { render :new }
        format.json { render json: @conge.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /conges/1
  # PATCH/PUT /conges/1.json
  def update
    respond_to do |format|
      if @conge.update(conge_params)
        @conges = Conge.all
        format.html { redirect_to @conge, notice: 'Conge was successfully updated.' }
        format.json { render :show, status: :ok, location: @conge }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @conge.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @conge = Conge.find(params[:id])
  end
  # DELETE /conges/1
  # DELETE /conges/1.json
  def destroy
    @conge.destroy
    @conges = Conge.all
    respond_to do |format|
      format.html { redirect_to conges_url, notice: 'Conge was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conge
      @conge = Conge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conge_params
      params.require(:conge).permit(:type_conge_id, :date_debut, :date_fin,  :motif, :matricule_employe)
    end
end
