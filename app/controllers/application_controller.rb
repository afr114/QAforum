class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    # checks to make sure there is a user at all
    def authorize
      redirect_to login_url, alert: "Not Authorized" if current_user.nil?
    end

    # is the value of the user that is stored in the session
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user # makes accessible in views

    def log_in (user)
      session[:user_id] = user.id
    end
end
