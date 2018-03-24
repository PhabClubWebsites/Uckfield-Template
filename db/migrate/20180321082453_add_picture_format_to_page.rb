class AddPictureFormatToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :img_one_format, :string
    add_column :pages, :img_two_format, :string
  end
end
