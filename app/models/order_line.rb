class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum status: ["pending", "confirmed", "cancelled", "completed"]
end
