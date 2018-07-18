class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize
  before_action :set_i18n_locale_from_params

  protected

  def set_i18n_locale_from_params
    binding.pry
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

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
