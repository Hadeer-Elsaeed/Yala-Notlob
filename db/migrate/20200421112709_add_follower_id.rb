class AddFollowerId < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :follower_id, :integer
    add_column :friendships, :followee_id, :integer
  end
end
