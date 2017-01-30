ENV['RAILS_ENV'] ||= 'test'

class ActiveSupport::TestCase
  fixtures :all

  # Checks if user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Logs in as a specific user.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  # Logs in as a specific user.
  def log_in_as(user,password)
    post login_path, session: { email: user.email, password: password } 
  end
end