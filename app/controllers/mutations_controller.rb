class MutationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mutation, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # GET /mutations
  # GET /mutations.json
  def index
    @mutations = Mutation.all
  end

  # GET /mutations/1
  # GET /mutations/1.json
  def show
  end

  # GET /mutations/new
  def new
    @mutation = Mutation.new
  end

  # GET /mutations/1/edit
  def edit
  end

  # POST /mutations
  # POST /mutations.json
  def create
    @mutation = current_user.mutations.build(mutation_params)

    respond_to do |format|
      if @mutation.save
        @mutations = Mutation.all

        format.html { redirect_to @mutation, notice: 'Mutation was successfully created.' }
        format.json { render :show, status: :created, location: @mutation }
        format.js
      else
        format.html { render :new }
        format.json { render json: @mutation.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /mutations/1
  # PATCH/PUT /mutations/1.json
  def update
    respond_to do |format|
      if @mutation.update(mutation_params)
        @mutations = Mutation.all

        format.html { redirect_to @mutation, notice: 'Mutation was successfully updated.' }
        format.json { render :show, status: :ok, location: @mutation }
        format.js

      else
        format.html { render :edit }
        format.json { render json: @mutation.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end


  def delete
    @mutation = Mutation.find(params[:id])
  end

  # DELETE /mutations/1
  # DELETE /mutations/1.json
  def destroy
    @mutation.destroy
    @mutations = Mutation.all

    respond_to do |format|
      format.html { redirect_to mutations_url, notice: 'Mutation was successfully destroyed.' }
      format.json { head :no_content }
      format.js

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mutation
      @mutation = Mutation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mutation_params
      params.require(:mutation).permit(:matricule_employe, :etablissement_origine, :etablissement_destination, :motif, :date_mutation)
    end
end
