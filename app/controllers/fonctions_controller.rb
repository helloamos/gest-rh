class FonctionsController < ApplicationController
  before_action :set_fonction, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'

  # GET /fonctions
  # GET /fonctions.json
  def index
    @fonctions = Fonction.all
  end

  # GET /fonctions/1
  # GET /fonctions/1.json
  def show
  end

  # GET /fonctions/new
  def new
    @fonction = Fonction.new
  end

  # GET /fonctions/1/edit
  def edit
  end

  # POST /fonctions
  # POST /fonctions.json
  def create
    @fonction = current_user.fonctions.build(fonction_params)

    respond_to do |format|
      if @fonction.save
        @fonctions = Fonction.all
        format.html { redirect_to @fonction, notice: 'Fonction was successfully created.' }
        format.json { render :show, status: :created, location: @fonction }
        format.js
      else
        format.html { render :new }
        format.json { render json: @fonction.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /fonctions/1
  # PATCH/PUT /fonctions/1.json
  def update
    respond_to do |format|
      if @fonction.update(fonction_params)
        @fonctions = Fonction.all
        format.html { redirect_to @fonction, notice: 'Fonction was successfully updated.' }
        format.json { render :show, status: :ok, location: @fonction }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @fonction.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @fonction = Fonction.find(params[:id])
  end

  # DELETE /fonctions/1
  # DELETE /fonctions/1.json
  def destroy
    @fonction.destroy
    respond_to do |format|
      @fonctions = Fonction.all
      format.html { redirect_to fonctions_url, notice: 'Fonction was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fonction
      @fonction = Fonction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fonction_params
      params.require(:fonction).permit(:nom)
    end
end
