class CreateOrderGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :order_groups do |t|
      t.integer :group_id
      t.integer :order_id

      t.timestamps
    end
  end
end
