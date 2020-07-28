class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  def new
  end

  def create
   @user = find_user
    if @user && @user.authenticate(params[:password])
        login_user(@user)
        flash[:notice] = "Login succesfull! Welcome #{@user.username}"
        redirect_to @user
    else 
      flash[:notice] = "Incorrect username or password"
      redirect_to login_path 
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Logged out!"
    redirect_to login_path
  end

  private
  def find_user
    User.find_by(username: params[:username])
  end
end
