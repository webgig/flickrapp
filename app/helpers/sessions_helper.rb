module SessionsHelper
  
  # Logs the user in.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Return the current logged-in user if any 
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Checks if the user is logged in.
  def logged_in?
    !current_user.nil?
  end

  def app_session 
    unless logged_in?
        redirect_to  "/login"
    end        
  end
end
