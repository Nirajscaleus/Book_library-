class UsersController < ApplicationController
  def index
    @users  = User.all
  end

  def show
   @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end
  
  def create
   
    @user = User.new(user_params)
    if @user.save
  
      flash[:notice] = "user is successfully signup...!"
      redirect_to login_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username ,:email, :password, :password_confirmation, :role)
  end
end