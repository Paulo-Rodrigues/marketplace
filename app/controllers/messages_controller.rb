class MessagesController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @message = @order.messages.new(message_params)
    @message.user = current_user
    @message.save

    redirect_to @order, notice: 'Mensagem enviada com sucesso'
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
