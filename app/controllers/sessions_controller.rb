class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(username: params[:username]@user.authenticate (params[:password)]
          session[:user_id] = @user.id
          flash[:notice] = "login succesfull! Welcome #{user.name}"
      redirect_to @user
  else flash[:notice] = "incorrect username or password"
      redirect_to login_path 
  end

  def destroy
    session.delete(:user_id)
    redirect_to posts_url, notice: 'Logged out!'
  end
end
