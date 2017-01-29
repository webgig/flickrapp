class SessionsController < ApplicationController
  def new
  end
  

  # Login action
  def login
    user = User.find_by(email: params[:session][:email].downcase)
    # Authenticate  the user
    if user && user.authenticate(params[:session][:password])
        # Log the user in and redirect the user to the main view.
        log_in user
        redirect_to "/home"
    else
      # Invalid  Login Credentials , so render the login view.
    	flash.now[:danger] = 'Invalid Login Credentials!'
      render 'new'
    end
  end
  
  # Log out action
  def logout
    log_out
    redirect_to root_url
  end

end
