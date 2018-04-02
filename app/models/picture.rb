class Picture < ActiveRecord::Base
  belongs_to :gallery

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  def split_image_path
    return self.image.url.split("/").last.split("?").first
  end
end