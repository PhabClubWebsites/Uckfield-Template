class ClubsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_club, only: [:edit, :update]
    def new
      @club = Club.new
    end
    
    def create
      @club = Club.new(club_params)
      if @club.save
         flash[:success] = "Your club info has been created!"
         redirect_to pages_path
      else
         flash[:danger] = @club.errors.full_messages.join(", ")
         render 'new'
      end  
    end
    
    def edit
    
    end
    
    def update
      if @club.update(club_params)
        flash[:success] = "The club details were successfully updated"
        redirect_to pages_path
      else
        flash[:danger] = @club.errors.full_messages.join(", ")
        render 'edit'
      end
    end
    
    private
    
    def club_params
       params.require(:club).permit(:club_name, :club_leader, :contact_email, :club_logo, :contact_number, :meeting_times, :meeting_address) 
    end
    
    def set_club
      @club = Club.find(params[:id])
    end
    
end