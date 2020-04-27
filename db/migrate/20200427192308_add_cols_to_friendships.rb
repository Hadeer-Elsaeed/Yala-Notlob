class AddColsToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :status, :string, null: true,optional: true
    add_column :friendships, :group_id, :integer, null: true,optional: true
  end
end
