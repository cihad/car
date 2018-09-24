class ModelsController < ApplicationController
  include SortableTreeController::Sort
  before_action :set_brand
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: :sort
  sortable_tree 'Model'

  # GET /models
  # GET /models.json
  def index
    @models = @brand.models.arrange(:order => :pos)
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  # POST /models.json
  def create
    @model = @brand.models.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to [@brand, @model], notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to [@brand, @model], notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_brand
      @brand = Brand.find_by!("lower(name) = ?", params[:brand_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:brand_id, :name, :fuel_type,
        :engine_size, :power, :power_unit, :torque, :transmission,
        :acceleration, :urban_consumption, :extra_urban_consumption,
        :combined_consumption, :top_speed, images: [])
    end
end
