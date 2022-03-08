class CreateHolidays < ActiveRecord::Migration[6.1]
  def change
    create_table :holidays do |t|
      t.integer :user_id
      t.text :content
      t.string :image_id

      t.timestamps
    end
  end
end
