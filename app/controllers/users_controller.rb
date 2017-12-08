class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Welcome to Ajax Bali Products"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice] = "Something went wrong:"
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
