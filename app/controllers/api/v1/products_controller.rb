class Api::V1::ProductsController < ActionController::API
  def index
    @products = Product.available

    render json: @products, status: :ok
  end
end
