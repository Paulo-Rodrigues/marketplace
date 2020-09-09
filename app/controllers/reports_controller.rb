class ReportsController < ApplicationController
  def new
  end

  def create
    current_user.reports.create!(reason: params[:reason], reportable: @reportable)

    redirect_to root_path, notice: 'Denúncia enviada'
  end
end
