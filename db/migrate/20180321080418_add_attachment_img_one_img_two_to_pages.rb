class AddAttachmentImgOneImgTwoToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :img_one
      t.attachment :img_two
    end
  end

  def self.down
    remove_attachment :pages, :img_one
    remove_attachment :pages, :img_two
  end
end
