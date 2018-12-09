class TypeSanctionsController < ApplicationController
  before_action :set_type_sanction, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'

  # GET /type_sanctions
  # GET /type_sanctions.json
  def index
    @type_sanctions = TypeSanction.all
  end

  # GET /type_sanctions/1
  # GET /type_sanctions/1.json
  def show
  end

  # GET /type_sanctions/new
  def new
    @type_sanction = TypeSanction.new
  end

  # GET /type_sanctions/1/edit
  def edit
  end

  # POST /type_sanctions
  # POST /type_sanctions.json
  def create
    @type_sanction = TypeSanction.new(type_sanction_params)

    respond_to do |format|
      if @type_sanction.save
        @type_sanctions = TypeSanction.all

        format.html { redirect_to @type_sanction, notice: 'Type sanction was successfully created.' }
        format.json { render :show, status: :created, location: @type_sanction }
        format.js
      else
        format.html { render :new }
        format.json { render json: @type_sanction.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /type_sanctions/1
  # PATCH/PUT /type_sanctions/1.json
  def update
    respond_to do |format|
      if @type_sanction.update(type_sanction_params)

        @type_sanctions = TypeSanction.all

        format.js

        format.html { redirect_to @type_sanction, notice: 'Type sanction was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_sanction }
      else
        format.html { render :edit }
        format.json { render json: @type_sanction.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  def delete
    @type_sanction = TypeSanction.find(params[:id])
  end

  # DELETE /type_sanctions/1
  # DELETE /type_sanctions/1.json
  def destroy
    @type_sanction.destroy
    @type_sanctions = TypeSanction.all

    respond_to do |format|
      format.html { redirect_to type_sanctions_url, notice: 'Type sanction was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_sanction
      @type_sanction = TypeSanction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_sanction_params
      params.require(:type_sanction).permit(:nom, :description, :etat)
    end
end
