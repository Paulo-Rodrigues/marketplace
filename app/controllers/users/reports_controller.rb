class Users::ReportsController < ReportsController
  before_action :set_reportable

  private

  def set_reportable
    @reportable = User.find(params[:user_id])
  end
end
