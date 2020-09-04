class OrdersController < ApplicationController
  def index
    @user_orders = Order.where(buyer: current_user) + Order.where(seller: current_user)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    product = Product.find(params[:product_id])
    @order = Order.new(product: product, seller: product.user, buyer: current_user)
    @order.save!
    redirect_to @order, notice: 'Espere o vendedor confirmar sua compra'
  end

end
