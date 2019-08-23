class OrderProduct < ApplicationRecord
    belongs_to :orders
    belongs_to :customer
end
