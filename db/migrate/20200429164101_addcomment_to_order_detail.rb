class AddcommentToOrderDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :order_details, :comment, :string
  end
end
