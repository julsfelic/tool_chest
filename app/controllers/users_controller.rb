class UsersController < ApplicationController
  

  def new

  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      flash[:alert] = "welcome #{user.username}!"
      redirect_to user_path(user.id)
    else
      render :new
    end
  end

  def show
    @user = current_user
    # binding.pry
    @categories = Category.all
    @tools = @user.tools
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
