class AddAttachmentGalleryBannerImgToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :gallery_banner_img
    end
  end

  def self.down
    remove_attachment :clubs, :gallery_banner_img
  end
end
