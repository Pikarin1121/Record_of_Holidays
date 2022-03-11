class CreateHolidayComments < ActiveRecord::Migration[6.1]
  def change
    create_table :holiday_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :holiday_id
      t.string :image_id

      t.timestamps
    end
  end
end
