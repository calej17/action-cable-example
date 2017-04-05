class SessionsController < ApplicationController
  skip_before_filter :authenticate_user, raise: false
  before_filter :save_login_state, only: [:new, :create]

  def new
  end

  def create
    authorized_user = User.authenticate(params[:session][:username])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to root_path, notice: "Welcome back, #{authorized_user.username}"
    else
      flash.now[:alert] = "Invalid Username"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end
end
