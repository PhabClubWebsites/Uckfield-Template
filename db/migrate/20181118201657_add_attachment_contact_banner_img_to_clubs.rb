class AddAttachmentContactBannerImgToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :contact_banner_img
    end
  end

  def self.down
    remove_attachment :clubs, :contact_banner_img
  end
end
