class CreateOrderFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :order_friends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
