class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end

  def create
    @favorite = Favorite.new(product_id: params[:product_id])
    @favorite.user = current_user

    @favorite.save!
    redirect_back(fallback_location: root_path)
  end

  def destroy
    product = Product.find(params[:id])
    Favorite.find_by(user: current_user, product: product).destroy

    redirect_back(fallback_location: root_path)
  end

end
