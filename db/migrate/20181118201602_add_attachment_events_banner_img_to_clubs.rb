class AddAttachmentEventsBannerImgToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :events_banner_img
    end
  end

  def self.down
    remove_attachment :clubs, :events_banner_img
  end
end
