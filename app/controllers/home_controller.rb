class HomeController < ActionController::Base
  protect_from_forgery

  def index
  	render :layout => "application"
  end
end
