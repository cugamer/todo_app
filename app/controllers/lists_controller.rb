class ListsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: [:destroy]

  def create
    list = current_user.lists.new(list_params)
    if list.save
      flash.now[:success] = "Your new list has been created"
    else
      flash.now[:danger] = list.errors.full_messages[0]
    end
    
    @lists = current_user.lists.all
    redirect_to root_path
  end
  
  def destroy
    list = List.find(params[:id])
    name = list.name
    
    if list.destroy
      flash[:success] = "The #{name} list was removed successfully."
    else
      flash[:danger] = "The #{name} list was not removed."
    end
    
    @lists = current_user.lists.all
    redirect_to root_path
  end
  
  private
    def list_params
      params.require(:list).permit(:name)
    end
    
    def signed_in_user
      unless signed_in?
        flash[:danger] = "Please sign in to access this function."
        redirect_to signin_path
      end
    end
    
    def correct_user
      user_id = List.find(params[:id]).user_id
      redirect_to root_path unless current_user?(User.find(user_id))
    end
end
