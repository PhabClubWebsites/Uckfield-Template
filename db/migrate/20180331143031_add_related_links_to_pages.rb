class AddRelatedLinksToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :links_position, :string
    add_column :pages, :link_text_one, :string
    add_column :pages, :link_url_one, :string
    add_column :pages, :link_text_two, :string
    add_column :pages, :link_url_two, :string
    add_column :pages, :link_text_three, :string
    add_column :pages, :link_url_three, :string
  end
end
