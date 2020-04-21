class Group < ApplicationRecord
  belongs_to :User
  has_many:friendships
end
