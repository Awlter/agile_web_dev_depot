class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize

  protected

  def authorize
    if request.format.html?
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: 'Please log in'
      end
    else
      authenticate_or_request_with_http_basic do |id, password|
        user = User.find_by(id: id)
        render plain: 'failed' if !user || !user.validate(password)
      end
    end
  end
end
