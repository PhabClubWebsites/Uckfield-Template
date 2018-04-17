class AddBackgroundPositionToClub < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :bg_position, :integer, :default => 100
  end
end
