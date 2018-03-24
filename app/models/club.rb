class Club < ActiveRecord::Base
  belongs_to :admin, optional: true
  has_many :pages
  
  has_attached_file :club_logo, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :club_logo, :content_type => /\Aimage\/.*\z/
end