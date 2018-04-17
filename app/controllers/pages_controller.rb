class PagesController < ApplicationController
   before_action :authenticate_admin!, only: [:edit, :index, :update, :destroy, :new, :create]
   before_action :set_page, only: [:edit, :update, :show, :destroy, :published]
   
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(page_params)
    @page.admin_id = current_admin.id
    if @page.save
       flash[:success] = "Your article has been created!"
       redirect_to page_path(@page)
    else
       flash[:danger] = @page.errors.full_messages.join(", ")
       render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @page.update(page_params)
      flash[:success] = "Your article was succesfully updated"
      redirect_to page_path(@page)
    else
      flash[:danger] = @page.errors.full_messages.join(", ")
      redirect_to edit_page_path(@page, site_page: @page.site_page)
    end
  end
  
  def destroy
    @page.destroy
    flash[:danger] = "Your article has been deleted"
    redirect_to pages_path
  end
  
  def show
    @next_article = Page.where("site_page = ? AND id > ? AND published = ?", @page.site_page, @page.id, true).first
    @prev_article = Page.where("site_page = ? AND id < ? AND published = ?", @page.site_page, @page.id, true).last
  end
  
  def index
    @home_pages = Page.all.where("site_page = ?", "home").reverse;
    @about_pages = Page.all.where("site_page = ?", "about").reverse;
    @galleries = Gallery.all
  end
  
  def event_list
    @event_pages = Page.all.where("site_page = ?", "event").reverse;
  end
  
  def news_list
    @news_pages = Page.all.where("site_page = ?", "news").reverse;
  end
  
  def published
    if @page.published == false
      @page.update_attribute(:published, true)
      flash[:success] = "Your article has been published"
      redirect_to page_path(@page)
    elsif @page.published == true
      @page.update_attribute(:published, false)
      flash[:danger] = "Your article is no longer published"
      redirect_to pages_path
    end
      
  end
  
  def home
    @club = Club.all.where("id = ?", 1)
    @home_pages = Page.where("site_page = ? AND published = ?", "home", true).order(id: :desc)
  end
  
  def about
     
  end
  
  def news
     @news_pages = Page.where("site_page = ? AND published = ?", "news", true).paginate(:page => params[:page], :per_page => 5).order('id DESC')
  end
  
  def events
    @event_pages = Page.where("site_page = ? AND published = ?", "event", true).paginate(:page => params[:page], :per_page => 5).order('date_of_event DESC')
  end
  
  def contact_us
     
  end
  
  private
  
  def page_params
    params.require(:page).permit(:title, :date_of_event, :time_of_event, :content_one, :img_one, :img_one_format, :content_two, :img_two, :img_two_format, :content_three, :img_three, :img_three_format, :site_page, :admin_id, :links_position, :link_text_one, :link_url_one, :link_text_two, :link_url_two, :link_text_three, :link_url_three)
  end
  
  def set_page
    @page = Page.find(params[:id])
  end
   
end