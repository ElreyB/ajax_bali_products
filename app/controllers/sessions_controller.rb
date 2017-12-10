class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome to Ajax Bali Products"
      redirect_to '/'
    else
      flash[:notice] = "Something went wrong:"
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Come back to Ajax Bali Products Soon!"
    redirect_to '/'
  end

end
