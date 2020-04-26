class Notification < ApplicationRecord
    belongs_to :user, class_name:"USer"
    belongs_to :friendship, class_name: "User"
    belongs_to :notifiable, polymorphic: true
end
