class ProductsController < ApplicationController
  def index
    # @products = Product.all
    @products = Product.where(company: current_user.company)
  end
end
