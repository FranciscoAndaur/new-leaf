class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create]
  def index
    @users = User.all
  end
  def home
  end

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
    @errors = flash[:errors]
    render :new
  end
    
  def create
    @user = User.new(user_params)
    byebug
      if @user.save
        login_user(@user)
        redirect_to home_path(@user)

      else 
        flash[:errors] = @user.errors.full_messages
        redirect_to new_user_path
    end
  end

  def settings

  end

  def update
    password = params[:password]
    @user = User.update(user_params)
    redirect_to gardens_path
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end
  
  private
    
  def user_params
    params.require(:user).permit(:username, :password,:password_confirmation, garden_name:[:garden_name])
  end
  
  def find_user
   @user = User.find(params[:id])
  end

end