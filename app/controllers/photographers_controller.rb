class PhotographersController < ApplicationController
  # GET /photographers
  # GET /photographers.json
  def index
    @photographers = Photographer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photographers }
    end
  end

  # GET /photographers/1
  # GET /photographers/1.json
  def show
    @photographer = Photographer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photographer }
    end
  end

  # GET /photographers/new
  # GET /photographers/new.json
  def new
    @photographer = Photographer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photographer }
    end
  end

  # GET /photographers/1/edit
  def edit
    @photographer = Photographer.find(params[:id])
  end

  # POST /photographers
  # POST /photographers.json
  def create
    @photographer = Photographer.new(params[:photographer])

    respond_to do |format|
      if @photographer.save
        format.html { redirect_to @photographer, notice: 'Photographer was successfully created.' }
        format.json { render json: @photographer, status: :created, location: @photographer }
      else
        format.html { render action: "new" }
        format.json { render json: @photographer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photographers/1
  # PUT /photographers/1.json
  def update
    @photographer = Photographer.find(params[:id])

    respond_to do |format|
      if @photographer.update_attributes(params[:photographer])
        format.html { redirect_to @photographer, notice: 'Photographer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photographer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photographers/1
  # DELETE /photographers/1.json
  def destroy
    @photographer = Photographer.find(params[:id])
    @photographer.destroy

    respond_to do |format|
      format.html { redirect_to photographers_url }
      format.json { head :no_content }
    end
  end

  def photos
    @pictures = []
    max_photos = 15

    portfolio = ["http://www.facebook.com/ps.creativefactory", "http://www.flickr.com/praveenselvam"]
    portfolio = portfolio[Random.rand(portfolio.length)]

    if (portfolio.split("facebook.com/").length > 1)
      @pictures = pictures = get_photos_from_facebook(portfolio)
      @pictures = @pictures[1..max_photos] if @pictures.length > max_photos
    elsif (portfolio.split("flickr.com/").length > 1)
      @pictures = get_photos_from_flickr(portfolio)
      @pictures = @pictures[1..max_photos] if @pictures.length > max_photos
    end

    render :layout => false
  end

  def get_flickr_photo
    flickr = FlickRaw::Flickr.new
    info = flickr.photos.getInfo(:photo_id => params[:fid])
    redirect_to FlickRaw.url_b(info)
  end

  def get_photos_from_facebook(url)
    pictures = []
    begin
      @graph = Koala::Facebook::API.new(session[:access_token])
      @app = @graph.get_object(APP_CONFIG[:facebook][:app_id])
      username = url.split("www.facebook.com/")[1]
      if session[:access_token]
        @user    = @graph.get_object("me")
        # This is now mocked out. Replace with actual username.
        fql_query = "SELECT page_id, pic FROM page WHERE username = '#{username}'"
        page = @graph.fql_query(fql_query)
        page_id = page.first["page_id"]
        pictures = @graph.fql_query("SELECT src, src_height, src_width, src_small, src_small_height, src_small_width FROM photo WHERE pid IN (SELECT pid FROM photo WHERE aid IN (SELECT aid FROM album WHERE owner='#{page_id}' AND type!='profile'))")
      end
    rescue Koala::Facebook::APIError
      session[:access_token] = nil
    end
    return pictures
  end

  def get_photos_from_flickr(url)
    pictures = []
    FlickRaw.api_key = APP_CONFIG[:flickr][:key]
    FlickRaw.shared_secret = APP_CONFIG[:flickr][:secret]

    flickr = FlickRaw::Flickr.new
    photos = flickr.photos.search(:user_id => '48898139@N00')
    photos.each do |p|
      pictures.push({ "src" => "/photographers/get_flickr_photo/#{p["id"]}" })
    end
    return pictures
  end
end
