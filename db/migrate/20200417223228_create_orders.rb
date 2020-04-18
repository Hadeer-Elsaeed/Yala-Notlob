class CreateOrders < ActiveRecord::Migration[6.0]
  def change
#        drop_table :orders

    create_table :orders do |t|
      t.string :meal
      t.string :resturant
      t.string :status
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
