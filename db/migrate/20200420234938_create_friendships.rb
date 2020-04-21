class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :Group, null: false, foreign_key: true
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
