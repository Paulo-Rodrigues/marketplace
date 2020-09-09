class Products::ReportsController < ReportsController
  before_action :set_reportable

  private

  def set_reportable
    @reportable = Product.find(params[:product_id])
  end
end
