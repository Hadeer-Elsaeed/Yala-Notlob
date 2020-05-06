class CreateOrderGroups < ActiveRecord::Migration[6.0]
  def change
    # drop_table :order_groups

    create_table :order_groups do |t|
      t.integer :group_id
      t.integer :order_id

      t.timestamps
    end
  end
end
