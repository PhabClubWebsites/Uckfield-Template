module ApplicationHelper
    
    def club
        if Club.exists?(1)
            return Club.first
        else
            return false
        end
    end
end
