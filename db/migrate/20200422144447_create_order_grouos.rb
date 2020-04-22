class CreateOrderGrouos < ActiveRecord::Migration[6.0]
  def change
    create_table :order_grouos do |t|
      t.references :group, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
