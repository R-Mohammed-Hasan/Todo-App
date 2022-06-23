class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:current_user_id] = user.id
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :user_id)
  end
end
