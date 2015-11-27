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
  
  private
    def list_params
      params.require(:list).permit(:name)
    end
end
