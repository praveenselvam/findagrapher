class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def authorize
  	authorized = true
  	if session[:access_token]
	  	begin
	      @graph = Koala::Facebook::API.new(session[:access_token])
	      @user = @graph.get_object("me")
	  	rescue Koala::Facebook::APIError
	      session[:access_token] = nil
	      authorized = false
	    end
	  else
	  	authorized = false
	  end
  end
end
