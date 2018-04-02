class AddTimeOfEventToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :time_of_event, :time
  end
end
