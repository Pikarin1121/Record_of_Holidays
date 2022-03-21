class AddRoomIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :room_id, :integer
  end

  add_index :notifications, :room_id
end
