class LoginController < ActionController::Base
  protect_from_forgery

  def create
  	session[:access_token] = params[:access_token]
  	render :json => { :response => 'ok' }
  end
end
