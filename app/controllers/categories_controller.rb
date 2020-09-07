class CategoriesController < ApplicationController
  def show
    @products = Product.search_category(params[:id]).available
  end
end
