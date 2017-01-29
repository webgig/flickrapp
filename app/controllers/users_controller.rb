class UsersController < ApplicationController

  def index
   return redirect_to "/home"
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) 
    if @user.save
      log_in @user
    	flash[:success] = "Welcome to the Flickr Image Gallery!"
      redirect_to "/home"
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
