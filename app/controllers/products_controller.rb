class ProductsController < ApplicationController
  def index
    @products = Product.where(company: current_user.company)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.company = current_user.company

    if current_user.has_full_profile? && @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end
