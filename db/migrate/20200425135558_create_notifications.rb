class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :User_id
      t.integer :Friendship_id
      t.string :action
      t.integer :notifiable_id
      t.integer :notifiable_type

      t.timestamps
    end
  end
end
