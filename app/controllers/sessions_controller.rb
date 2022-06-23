class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      redirect_to users_login_path, danger: "Invalid credentials..! Please try again"
    end
  end

  def destroy
    session.delete(:current_user_id)
    flash[:notice] = "You have been logged out"
    @current_user = nil
    redirect_to root_path
  end
end
