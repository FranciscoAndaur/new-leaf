class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  def new
  end

  def create
    # we are only reading the data not creating a new user
     @user = User.find_by(username: params[:username])
     if @user && @user.authenticate (params[:password])
      login_user(@user)
      flash[:notice] = "Login Succesfull! Welcome #{user.name}"
      redirect_to @user
    else 
      flash[:notice] = "Incorrect Username or Password"
      redirect_to login_path 
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Logged out!'
  end
end
