class ProductsController < ApplicationController
  def index
    @products = Product.where(company: current_user.company)
  end

  def show
    @product = Product.find(params[:id])
  end
end
