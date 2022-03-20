class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false #通知を送ったユーザーID
      t.integer :visited_id, null: false #通知を送られたユーザーID
      t.integer :information_id #投稿のID
      t.string :action, default: '', null: false #通知の種類
      t.boolean :checked, default: false, null: false #通知を送られたユーザーが通知を確認したかの真偽値

      t.timestamps
    end

    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :information_id
  end
end
