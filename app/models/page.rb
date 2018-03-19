class Page < ActiveRecord::Base
    belongs_to :admin
    belongs_to :club
end