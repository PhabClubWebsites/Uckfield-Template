class AddAttachmentBgImageToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :bg_image
    end
  end

  def self.down
    remove_attachment :clubs, :bg_image
  end
end
