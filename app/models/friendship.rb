class Friendship < ApplicationRecord
  belongs_to :Group
  validates :Group, presence: false, allow_nil: true
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'
end
