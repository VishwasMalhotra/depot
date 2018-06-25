class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception
  before_action :authorize
  around_action :response_time

  private

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id])
  end

  def response_time
    start_time = Time.now
    yield
    end_time = Time.now
    response.set_header("X-Responded-In", end_time - start_time)
  end

  protected

    def authorize
      unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end








