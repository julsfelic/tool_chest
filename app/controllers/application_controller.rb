class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_tool


  def current_user
    # binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_tool
    @current_tool ||= current_user.tools.last if current_user && current_user.tools
  end

end
