class PagesController < ApplicationController
   before_action :authenticate_admin!, only: [:edit, :update, :destroy, :new, :create]
   before_action :set_page, only: [:edit, :update, :show, :destroy, :published]
   
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(page_params)
    @page.admin_id = current_admin.id
    if @page.save
       flash[:success] = "Your page has been created!"
       redirect_to pages_path
    else
       flash[:danger] = @page.errors.full_messages.join(", ")
       render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @page.update(page_params)
      flash[:success] = "The article was successfully updated"
      redirect_to pages_path
    else
      flash[:danger] = @page.errors.full_messages.join(", ")
      render 'edit'
    end
  end
  
  def destroy
    @page.destroy
    flash[:danger] = "Article was successfully deleted!"
    redirect_to pages_path
  end
  
  def show
    
  end
  
  def index
    @home_pages = Page.all.where("site_page = ?", "home");
    @event_pages = Page.all.where("site_page = ?", "event");
    @news_pages = Page.all.where("site_page = ?", "news");
    @about_pages = Page.all.where("site_page = ?", "about");
    #@club = Club.all.where("id = ?", 1);

  end
  
  def published
    @page.update_attribute(:published, true)
    flash[:success] = "Your article has been published"
    redirect_to pages_path  
  end
  
  def home
    @club = Club.all.where("id = ?", 1)
    @home_pages = Page.all.where("site_page = ? AND published = ?", "home", true)
  end
  
  def about
     
  end
  
  def news
     @news_pages = Page.all.where("site_page = ? AND published = ?", "news", true);
  end
  
  def events
  @event_pages = Page.all.where("site_page = ? AND published = ?", "event", true);
  end
  
  def shop
     
  end
  
  def contact_us
     
  end
  
  private
  
  def page_params
    params.require(:page).permit(:title, :content_one, :content_two, :content_three, :site_page, :admin_id)
  end
  
  def set_page
    @page = Page.find(params[:id])
  end
   
end