class ChangeOrderGrouToOrderGroup < ActiveRecord::Migration[6.0]
  def change
    rename_table :order_grouos, :order_groups
  end
end

