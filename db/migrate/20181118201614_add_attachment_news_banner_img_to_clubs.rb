class AddAttachmentNewsBannerImgToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :news_banner_img
    end
  end

  def self.down
    remove_attachment :clubs, :news_banner_img
  end
end
