class AdminController < ApplicationController
  before_action :check_authorization
  def index
    @total_orders = Order.count
  end
  private
    def check_authorization
    unless current_user.role.eql?('admin')
      redirect_to store_path, notice: 'You do not have privilege to access this section'
    end
  end
end
