class Friendship < ApplicationRecord
  belongs_to :Group
  validates :Group, presence: false, allow_nil: true
  belongs_to :User, :foreign_key => "user_id", :class_name => "User"
  belongs_to :friend, :foreign_key => "user_id", :class_name => "User"
end
