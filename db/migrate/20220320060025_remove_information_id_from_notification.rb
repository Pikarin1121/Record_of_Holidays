class RemoveInformationIdFromNotification < ActiveRecord::Migration[6.1]
  def change
    remove_column :notifications, :information_id, :integer
  end
end
