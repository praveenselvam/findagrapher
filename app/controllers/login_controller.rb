class LoginController < ActionController::Base
  protect_from_forgery

  def create
  	session[:access_token] = params[:access_token]
  	redirect_to params[:location] ? params[:location] : root_path
  end
end
