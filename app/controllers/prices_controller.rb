class PricesController < ApplicationController
  before_action :set_brand
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  # GET /prices
  # GET /prices.json
  def index
    @models = @brand.models.arrange(order: :pos)
  end

  # GET /prices/new
  def new
    @models = @brand.models.arrange(order: :pos)
  end

  # POST /prices
  # POST /prices.json
  def create
    if @brand.update(brand_params)
      redirect_to new_brand_price_path(@brand), notice: 'Price was successfully created.'
    else
      render :new
    end
  end

  private

    def set_brand
      @brand = Brand.find_by!("lower(name) = ?", params[:brand_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(models_attributes: [:id, prices_attributes: [:price, :currency]])
    end
end
