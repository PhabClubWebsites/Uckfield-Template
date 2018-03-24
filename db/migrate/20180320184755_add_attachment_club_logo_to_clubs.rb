class AddAttachmentClubLogoToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :club_logo
    end
  end

  def self.down
    remove_attachment :clubs, :club_logo
  end
end
