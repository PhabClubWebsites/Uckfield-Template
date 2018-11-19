class AddAttachmentAboutBannerImgToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :about_banner_img
    end
  end

  def self.down
    remove_attachment :clubs, :about_banner_img
  end
end
