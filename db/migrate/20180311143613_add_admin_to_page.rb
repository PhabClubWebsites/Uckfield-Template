class AddAdminToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :admin_id, :integer, foreign_key: true
  end
end
