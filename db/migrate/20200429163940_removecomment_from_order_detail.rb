class RemovecommentFromOrderDetail < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_details, :comment, :integer
  end
end
