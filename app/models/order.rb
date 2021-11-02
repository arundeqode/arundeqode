class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines, dependent: :destroy
  accepts_nested_attributes_for :order_lines, allow_destroy: true

  enum status: ["pending", "confirmed", "cancelled", "completed"]
end
