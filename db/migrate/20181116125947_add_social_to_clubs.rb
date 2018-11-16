class AddSocialToClubs < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :facebook_link, :string
    add_column :clubs, :twitter_link, :string
    add_column :clubs, :donate_link, :string
    add_column :clubs, :charity_number, :string
  end
end
