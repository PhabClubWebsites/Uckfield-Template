class AddAttachmentImgThreeToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :img_three
    end
  end

  def self.down
    remove_attachment :pages, :img_three
  end
end
