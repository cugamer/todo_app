class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show]
  before_action :correct_user, only: [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has been created!"
      signin @user
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def signed_in_user
      unless signed_in?
        flash[:danger] = "Please sign in to access this page"
        redirect_to signin_path
      end  
    end
    
    def correct_user
      redirect_to root_url unless current_user?(User.find(params[:id]))
    end
end
