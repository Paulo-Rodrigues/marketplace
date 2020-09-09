class SearchController < ApplicationController
  def index
    @search_result = Product.search(params[:q]).available
  end
end
