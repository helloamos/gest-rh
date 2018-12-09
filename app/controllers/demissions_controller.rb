class DemissionsController < ApplicationController
  before_action :set_demission, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'

  # GET /demissions
  # GET /demissions.json
  def index
    @demissions = Demission.all
  end

  # GET /demissions/1
  # GET /demissions/1.json
  def show
  end

  # GET /demissions/new
  def new
    @demission = Demission.new
  end

  # GET /demissions/1/edit
  def edit
  end

  # POST /demissions
  # POST /demissions.json
  def create
    @demission = current_user.demissions.build(demission_params)

    respond_to do |format|
      if @demission.save
        @demissions = Demission.all

        format.html { redirect_to @demission, notice: 'Demission was successfully created.' }
        format.json { render :show, status: :created, location: @demission }
        format.js
      else
        format.html { render :new }
        format.json { render json: @demission.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /demissions/1
  # PATCH/PUT /demissions/1.json
  def update
    respond_to do |format|
      if @demission.update(demission_params)
        @demissions = Demission.all

        format.js

        format.html { redirect_to @demission, notice: 'Demission was successfully updated.' }
        format.json { render :show, status: :ok, location: @demission }
      else
        format.html { render :edit }
        format.json { render json: @demission.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end
  def delete
    @demission = Demission.find(params[:id])
  end
  # DELETE /demissions/1
  # DELETE /demissions/1.json
  def destroy
    @demission.destroy
    @demissions = Demission.all

    respond_to do |format|
      format.html { redirect_to demissions_url, notice: 'Demission was successfully destroyed.' }
      format.json { head :no_content }
      format.js

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demission
      @demission = Demission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demission_params
      params.require(:demission).permit(:date_demission, :matricule_employe, :etat)
    end
end
