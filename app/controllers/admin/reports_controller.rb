class Admin::ReportsController < ApplicationController
  before_action :filter_by_date #:check_authorization ,:filter_by_date

  def index
    @orders = Order.by_date(@start_date, @end_date)
  end

  private

  def filter_by_date
    if params[:start_date] && params[:end_date]
      @start_date = params[:start_date]
      @end_date = params[:end_date]
    else
      @start_date = DateTime.current - 3.days
      @end_date = DateTime.current
    end
  end

  # def check_authorization
  #   unless current_user.role.eql?('admin')
  #     redirect_to store_path, notice: 'You do not have privilege to access this section'
  #   end
  # end
end
