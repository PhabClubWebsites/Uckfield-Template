class CreateClub < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.string :club_name
      t.string :club_leader
      t.string :contact_number
      t.string :contact_email
      t.string :meeting_time
      t.string :meeting_address
    end
  end
end
