class AddPublishedToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :published, :boolean, default: false
    add_column :pages, :date_of_event, :datetime
  end
end
