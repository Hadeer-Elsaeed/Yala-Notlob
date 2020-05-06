class OrderGroup < ApplicationRecord
    belongs_to :group
    belongs_to :order
end
