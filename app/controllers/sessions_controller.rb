class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:alert] = "Invalid login"
      render :new
    end
  end

  def destroy
    flash[:alert] = "Goodbye #{current_user.username}"
    session.clear
    redirect_to root_path
  end
end
