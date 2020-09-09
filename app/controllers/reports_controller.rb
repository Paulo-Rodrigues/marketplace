class ReportsController < ApplicationController
  def new
    @reportable = Product.find(params[:product_id])
  end

  def create
    current_user.reports.create!(reason: params[:reason], reportable: @reportable)

    redirect_to root_path, notice: 'Denúncia enviada'
  end
end
