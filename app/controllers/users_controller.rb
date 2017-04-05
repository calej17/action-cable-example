class UsersController < ApplicationController
  before_filter :save_login_state, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You're signed up!"
    else
      flash.now[:alert] = "There was an error signing you up... try again?"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
