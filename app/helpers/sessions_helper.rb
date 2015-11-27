module SessionsHelper
  def signin(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def signed_in?
    return !session[:user_id].nil?
  end
  
  def signout
    @current_user = nil
    session.delete(:user_id)
  end
  
end
