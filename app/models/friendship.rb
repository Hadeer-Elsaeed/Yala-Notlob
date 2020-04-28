class Friendship < ApplicationRecord
  # belongs_to :Group,optional: true
  # validates :Group, presence: false, allow_nil: true
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'
  # belongs_to :Group,optional: true
  validates :group_id, presence: false, allow_nil: true
  attr_accessor :virtual_attribute

  def virtual_attribute
  @virtual_attribute
  end

#setter
def virtual_attribute=(value)
  @virtual_attribute = value
end
end
