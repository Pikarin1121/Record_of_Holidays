class AddHolidayIdToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :holiday_id, :integer
  end
end
