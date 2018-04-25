class Gallery < ActiveRecord::Base

  has_many :pictures, :dependent => :destroy
  
  validates :name, presence: true
  
  def find_cover_image
    picture_id = self.cover
    picture = self.pictures.where("id = ?", picture_id).first
    if picture.blank?
      return ""
    else
      return picture.image.url(:medium)
    end
  end
  
  def find_thumb_image
    picture_id = self.cover
    picture = self.pictures.where("id = ?", picture_id).first
    if picture.blank?
      return ""
    else
      return picture.image.url(:thumb)
    end
  end
end