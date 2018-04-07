module ApplicationHelper
    
    def club
        if Club.size > 0
            return Club.first
        else
            return ''
        end
    end
    
    def nav_event_list
       return Page.where("site_page = ? AND published = ?", "event", true).order(date_of_event: :asc).limit(3);
    end
    
    def nav_news_list
       return Page.where("site_page = ? AND published = ?", "news", true).order(id: :desc).limit(3);
    end
    
    def nav_gallery_list
       return Gallery.where("published = ?", true).order(id: :desc).limit(3);
    end
    
    def handlise(string)
       words = string.split(" ")
       lowercase = []
       words.each_with_index do |word, i|
           lowercase[i] = word.downcase
       end
       return lowercase.join("_")
    end
    
    def recent_posts
       return Page.where("published = ?", true).order(id: :desc).limit(3) 
    end
    
    def upcoming_events
       return Page.where("site_page = ? AND published = ?", "event", true).order(date_of_event: :desc).limit(3) 
    end
    
    def club_news
       return Page.where("site_page = ? AND published = ?", "news", true).order(id: :desc).limit(3) 
    end
end
