class ChangeFriendship < ActiveRecord::Migration[6.0]
  def change
# remove_foreign_key :friendships, :Group
# change_column_null :friendships, :Group, :null => true
# Group_id:

change_table :friendships do |t|
  t.remove :Group_id

end

end
end
