class AddPageToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :site_page, :string
  end
end
