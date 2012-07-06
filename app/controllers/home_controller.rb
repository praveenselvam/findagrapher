class HomeController < ActionController::Base
  protect_from_forgery

  def index
  	begin
	  	@graph = Koala::Facebook::API.new(session[:access_token])
		  @app = @graph.get_object(APP_CONFIG[:facebook][:app_id])

		  page_url = params[:facebook_page_url]

		  if session[:access_token]
		    @user    = @graph.get_object("me")
		    # @friends = @graph.get_connections('me', 'friends')
		    # @photos  = @graph.get_connections('me', 'photos')
		    # @likes   = @graph.get_connections('me', 'likes').first(4)

		    # for other data you can always run fql
	    	# @friends_using_app = @graph.fql_query("SELECT uid, name, is_app_user, pic_square FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1 = me()) AND is_app_user = 1")	    	

	    	puts page_url
				if(!page_url.nil?)
		    	puts "*" * 100
		    	fql_query = "SELECT page_id, pic FROM page WHERE username = '#{params[:facebook_page_url]}'"
		    	puts fql_query
					page = @graph.fql_query(fql_query)
					puts page
		    	page_id = page.first["page_id"]
		    	puts page_id
		    	@pictures = @graph.fql_query("SELECT src, src_height, src_width, src_small, src_small_height, src_small_width FROM photo WHERE pid IN (SELECT pid FROM photo WHERE aid IN (SELECT aid FROM album WHERE owner='#{page_id}' AND type!='profile'))")
		    else
		    	@pictures = []
		    end
	    end
		rescue Koala::Facebook::APIError
	  	session[:access_token] = nil
	  end
  	
  	render :layout => "application"
  end
end
