class AdminsController < ApplicationController
   
   def dashboard
       
   end
    
  def index
    @admin_users = Admin.all
  end
end