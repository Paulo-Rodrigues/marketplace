class Api::V1::ProductsController < ActionController::API
  def index
    @products = Product.available

    render json: @products, status: :ok
  end

  def show
    @product = Product.find(params[:id])

    render json: @product, include: :user,  status: :ok
  end
end
