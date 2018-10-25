class TypeCongesController < ApplicationController
  before_action :set_type_conge, only: [:show, :edit, :update, :destroy]

  # GET /type_conges
  # GET /type_conges.json
  def index
    @type_conges = TypeConge.all
  end

  # GET /type_conges/1
  # GET /type_conges/1.json
  def show
  end

  # GET /type_conges/new
  def new
    @type_conge = TypeConge.new
  end

  # GET /type_conges/1/edit
  def edit
  end

  # POST /type_conges
  # POST /type_conges.json
  def create
    @type_conge = TypeConge.new(type_conge_params)

    respond_to do |format|
      if @type_conge.save
        format.html { redirect_to @type_conge, notice: 'Type conge was successfully created.' }
        format.json { render :show, status: :created, location: @type_conge }
      else
        format.html { render :new }
        format.json { render json: @type_conge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_conges/1
  # PATCH/PUT /type_conges/1.json
  def update
    respond_to do |format|
      if @type_conge.update(type_conge_params)
        format.html { redirect_to @type_conge, notice: 'Type conge was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_conge }
      else
        format.html { render :edit }
        format.json { render json: @type_conge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_conges/1
  # DELETE /type_conges/1.json
  def destroy
    @type_conge.destroy
    respond_to do |format|
      format.html { redirect_to type_conges_url, notice: 'Type conge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_conge
      @type_conge = TypeConge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_conge_params
      params.require(:type_conge).permit(:name)
    end
end
