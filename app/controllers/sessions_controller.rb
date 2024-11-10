class SessionsController < ApplicationController

    def new 
     @user = User.new
    end

    def create   
      @user = User.find_by(email: login_params[:email])
        if @user && @user.authenticate(login_params[:password]) 
          session[:user_id] = @user.id
          redirect_to root_path, notice: "Logged in!"
        else
         render :new, notice: "invalid passworld"
      end
    end
    def destroy
      session[:user_id] = nil
      redirect_to root_path notice: "logged out"
    end

    def login_params
      params.require(:user).permit(:email,:password)
    end
end
