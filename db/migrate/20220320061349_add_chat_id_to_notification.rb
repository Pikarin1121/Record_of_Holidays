class AddChatIdToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :chat_id, :integer
    add_column :notifications, :holiday_comment_id, :integer
  end

  add_index :notifications, :holiday_id
  add_index :notifications, :holiday_comment_id
  add_index :notifications, :chat_id
end
