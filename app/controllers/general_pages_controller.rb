class GeneralPagesController < ApplicationController
  def homepage
    if signed_in?
      @lists = current_user.lists.all
    end
  end
  
  def help
  end
end
