class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :confirm, :cancel]
  def index
    @user_orders = Order.user_orders(current_user)
  end

  def show
  end

  def create
    product = Product.find(params[:product_id])
    @order = Order.new(product: product, seller: product.user, buyer: current_user)
    @order.save!
    redirect_to @order, notice: 'Espere o vendedor confirmar sua compra'
  end

  def confirm
    @order.concluded!
    redirect_to orders_path, notice: 'Venda confirmada'
  end

  def cancel
    @order.canceled!
    redirect_to orders_path, notice: 'Venda cancelada'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

end
