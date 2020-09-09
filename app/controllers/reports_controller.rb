class ReportsController < ApplicationController
  def new
    @reportable = Product.find(params[:product_id])
  end

  def create
    product = Product.find(params[:product_id])
    current_user.reports.create!(reason: params[:reason], reportable: product)

    redirect_to root_path, notice: 'Denúncia enviada'
  end
end
