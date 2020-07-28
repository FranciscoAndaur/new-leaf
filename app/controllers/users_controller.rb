class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create]

  def settings
    #find_user
    @user = current_user
    
  end

  def edit
    #find_user
    render :edit
  end

  def new
    @user = User.new
    @error = flash[:error]
    render :new
  end
    
  def create
    @user = User.create(user_params)
      if @user.valid?
        login_user(@user)
        redirect_to @user
      else 
        flash[:error]= @user.errors.full_messages
        redirect_to new_user_path
    end
  end

  def update

  end

  def destroy
    @user.destroy
    redirect_to :new_user_path
  end
  
  private
    
  def user_params
    params.require(:user).permit(:username, :password, :email, :avatar )
  end
  
  def find_user
   @user = User.find(params[:id])
  end

end