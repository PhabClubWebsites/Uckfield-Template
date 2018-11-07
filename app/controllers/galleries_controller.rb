class GalleriesController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update, :destroy, :published, :new, :gallery_admin]
  before_action :set_gallery, only: [:edit, :update, :show, :destroy, :published]
  layout "admin", only: [:gallery_admin, :new, :create]
  
  def index
    @galleries = Gallery.where("published = ?", true).paginate(:page => params[:page], :per_page => 5).order(id: :desc)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end
  
  def gallery_admin
    @galleries = Gallery.all.order(id: :desc)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  def show
    @pictures = @gallery.pictures.reverse

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  def edit
  end

  def create
    layout "admin"
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save

        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
          }
        end

        format.html { redirect_to @gallery, notice: 'Your gallery was successfully created!' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @gallery.update_attributes(gallery_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
          }
        end
        format.html { redirect_to @gallery, success: 'Your gallery was successfully updated!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to gallery_list_path }
      format.json { head :no_content }
    end
  end
  
  def published
    if @gallery.published == false
      @gallery.update_attribute(:published, true)
      flash[:success] = "Your gallery has been published!"
      redirect_to gallery_path(@gallery)
    elsif @gallery.published == true
      @gallery.update_attribute(:published, false)
      flash[:danger] = "Your gallery is no longer published."
      redirect_to gallery_path(@gallery)
    end
  end
  
  def make_default
    # @gallery = Gallery.find(params[:gallery_id])
    # @picture = Picture.find(params[:id])

    @gallery.cover = @picture.id
    @gallery.save

    respond_to do |format|
      format.js
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:description, :name, :pictures, :published)
  end
  
  def set_gallery
    @gallery = Gallery.find(params[:id])
  end
end