class Admin::ReportsController < Admin::BaseController
  def index
    filter_by_date
    @orders = Order.by_date(@start_date, @end_date)
  end

  private

  def filter_by_date
    if (params[:start_date] && params[:end_date]) && !(params[:start_date].empty? || params[:end_date].empty?)
      @start_date = params[:start_date]
      @end_date = params[:end_date]
    else
      @start_date = DateTime.current - 3.days
      @end_date = DateTime.current
    end
  end
end
