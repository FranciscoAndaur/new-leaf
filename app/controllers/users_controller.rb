class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create]

  def show
    #find_user
    render :show
  end

  def edit
    #find_user
    render :edit
  end

  def new
    @user = User.new
    @error = flash[:errors]
    render :new
  end
    
  def create
    @user = User.create(user_params)
      if @user.valid?
        # this sets up the session for the user
        login_user(@user)
        redirect_to @user
      else 
        flash[:errors]= @user.errors.full_messages
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