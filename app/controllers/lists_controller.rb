class ListsController < ApplicationController
  def create
    list = current_user.lists.new(list_params)
    if list.save
      flash.now[:success] = "Your new list has been created"
    else
      flash.now[:danger] = list.errors.full_messages[0]
    end
    
    @lists = current_user.lists.all
    render 'general_pages/homepage'
  end
  
  def destroy
    list = List.find(params[:id])
    name = list.name
    
    if list.destroy
      flash.now[:success] = "The #{name} list was removed successfully."
    else
      flash.now[:danger] = "The #{name} list was not removed."
    end
    
    @lists = current_user.lists.all
    render 'general_pages/homepage'
  end
  
  private
    def list_params
      params.require(:list).permit(:name)
    end
end
