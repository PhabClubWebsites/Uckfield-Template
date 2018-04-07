class AdminsController < ApplicationController
   before_action :authenticate_admin!
   
   def dashboard
   end
    
  def index
    @admin_users = Admin.all
  end
end