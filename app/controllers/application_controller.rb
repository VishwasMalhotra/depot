class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception
  before_action :authenticate
  before_action :page_hit_count
  around_action :response_time
  before_action :set_locale

  def page_hit_count
    if cookies.key?(request.url)
      cookies[request.url] = cookies[request.url].to_i + 1
    else
      cookies[request.url] = 1
    end
  end

  private

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id])
  end

  def response_time
    start_time = Time.current
    yield
    end_time = Time.current
    response.set_header("X-Responded-In", end_time - start_time)
  end

  def set_locale
    I18n.locale = current_user.language || I18n.default_locale
  end

  protected

    def authenticate
      unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end
