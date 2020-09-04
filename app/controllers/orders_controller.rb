class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    @order = Order.new(product: product)
    @order.save!
    redirect_to @order, notice: 'Espere o vendedor confirmar sua compra'
  end

  def show
    @order = Order.find(params[:id])
  end
end
