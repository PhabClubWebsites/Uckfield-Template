class AddPostAddressToClubs < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :postal_address, :string
  end
end
