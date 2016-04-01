class GeneralPagesController < ApplicationController
  def homepage
    if signed_in?
      @lists = current_user.lists.all.order(:created_at).paginate(:page => params[:page], :per_page => 10)
    end
  end
  
  def help
  end
end
