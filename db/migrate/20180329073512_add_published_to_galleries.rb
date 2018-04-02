class AddPublishedToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :published, :boolean, default: false
  end
end
