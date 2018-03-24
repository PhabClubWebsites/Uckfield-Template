class Gallery < ActiveRecord::Base

  has_many :pictures, :dependent => :destroy
  
  def find_cover_image
     picture_id = self.cover
     picture = self.pictures.where("id = ?", picture_id).first
     return picture.image.url
  end
end