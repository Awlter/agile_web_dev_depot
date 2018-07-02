class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully.'
      redirect_to admin_url
    else
      redirect_to login_url, alert: 'Invalid password/user combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: 'Logged out'
  end
end
