class ApplicationController < ActionController::Base
  before_filter :authenticate_user
  protect_from_forgery with: :exception

  def authenticate_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
      return true
    else
      redirect_to signin_path
      return false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to root_path
      return false
    else
      return true
    end
  end
end
