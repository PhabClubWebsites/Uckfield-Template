class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content_one
      t.text :content_two
      t.text :content_three
      t.timestamps
    end
  end
end
