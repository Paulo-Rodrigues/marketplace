class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :suspend, :activate, :edit, :update]

  def index
    @products = Product.available_products(current_user)
  end

  def show
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

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Produto editado com sucesso'
    else
      render 'new'
    end
  end

  def suspend
    @product.suspended!
    redirect_back(fallback_location: root_path)
  end

  def activate
    @product.available!
    redirect_back(fallback_location: root_path)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :category_id)
  end
end
