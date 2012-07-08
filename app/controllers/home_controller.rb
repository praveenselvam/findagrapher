class HomeController < ApplicationController
  protect_from_forgery
  before_filter :authorize

  def index
  	render :layout => "application"
  end
end
