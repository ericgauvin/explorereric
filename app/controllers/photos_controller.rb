class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all

      if (params.has_key?(:country))

    	if (!params[:country].empty? && !params[:year].empty?)
    		country = params[:country]
    		year = params[:year]
    		@photos = Photo.search(country: country, year: year).order("created_at DESC")

    	elsif (!params[:country].empty? && params[:year].empty?)
    		country = params[:country]
    		@photos = Photo.search(country: country).order("created_at DESC")

    	elsif (params[:country].empty? && !params[:year].empty?)
    		year = params[:year]
    		@photos = Photo.search(year: year).order("created_at DESC")

    end

  	else
  		@photos = Photo.all.order("created_at ASC")
  	end

  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    if logged_in?
      if current_user.role != 'admin'
        redirect_to photos_path
      else
        @photo = Photo.new
      end
    else
      redirect_to photos_path
    end
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :country, :city, :year, :month)
    end
end
