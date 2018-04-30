class AdminsController < ApplicationController
   before_action :authenticate_admin!
   
   def dashboard
     @homepage = Page.all.where("site_page = ?", "home").first
      if !@homepage.blank?
       return @homepage
      else
        return false
      end
   end
    
  def index
    @admin_users = Admin.all
  end
end