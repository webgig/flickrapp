class UsersController < ApplicationController

  def index
   return redirect_to "/home"
  end

  def new
  	@user = User.new
  end

  # Create new users
  def create
  	@user = User.new(user_params) 
    if @user.save
      log_in @user # Log In the user upon Successfull Crration
    	flash[:success] = "Welcome to the Flickr Image Gallery!"
      redirect_to "/home" # Redirect to the main page
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
