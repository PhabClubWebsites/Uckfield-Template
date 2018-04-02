class AddThirdImageFormatToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :img_three_format, :string
  end
end
