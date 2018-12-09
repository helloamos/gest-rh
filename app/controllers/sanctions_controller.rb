class SanctionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_sanction, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # GET /sanctions
  # GET /sanctions.json
  def index
    @sanctions = Sanction.all
  end

  # GET /sanctions/1
  # GET /sanctions/1.json
  def show
  end

  # GET /sanctions/new
  def new
    @type_sanctions = TypeSanction.all
    @sanction = Sanction.new
  end

  # GET /sanctions/1/edit
  def edit
    @type_sanctions = TypeSanction.all
  end

  # POST /sanctions
  # POST /sanctions.json
  def create
    @sanction = current_user.sanctions.build(sanction_params)

    respond_to do |format|
      if @sanction.save
        @sanctions = Sanction.all

        format.html { redirect_to @sanction, notice: 'Sanction was successfully created.' }
        format.json { render :show, status: :created, location: @sanction }
        format.js
      else
        format.html { render :new }
        format.json { render json: @sanction.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /sanctions/1
  # PATCH/PUT /sanctions/1.json
  def update
    respond_to do |format|
      if @sanction.update(sanction_params)
        @sanctions = Sanction.all

        format.html { redirect_to @sanction, notice: 'Sanction was successfully updated.' }
        format.json { render :show, status: :ok, location: @sanction }
        format.js

      else
        format.html { render :edit }
        format.json { render json: @sanction.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end
  def delete
    @sanction = Sanction.find(params[:id])
  end

  # DELETE /sanctions/1
  # DELETE /sanctions/1.json
  def destroy
    @sanction.destroy
    @sanctions = Sanction.all

    respond_to do |format|
      format.html { redirect_to sanctions_url, notice: 'Sanction was successfully destroyed.' }
      format.json { head :no_content }
      format.js

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sanction
      @sanction = Sanction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sanction_params
      params.require(:sanction).permit(:matricule_employe, :date_debut, :date_fin, :type_sanction_id, :motif)
    end
end
