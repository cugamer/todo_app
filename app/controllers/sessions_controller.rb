class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if(user && user.authenticate(params[:session][:password]))
      signin user
      flash[:success] = "You are now signed in"
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "Username/password combination was incorrect"
      render 'new'
    end
  end
  
  def destroy
    signout
    redirect_to root_path
  end
end
