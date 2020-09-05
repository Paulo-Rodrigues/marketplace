class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]
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

  def edit
  end

  def update
    if params[:commit] == 'Efetuar venda'
      @order.update(status: :concluded, final_price: params[:final_price])
      flash[:notice] = 'Venda confirmada'
    elsif params[:commit] == 'Cancelar venda'
      @order.canceled!
      flash[:notice] = 'Venda cancelada'
    end
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

end
