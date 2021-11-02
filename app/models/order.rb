class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines, dependent: :destroy
  accepts_nested_attributes_for :order_lines, allow_destroy: true
  after_create :destroy_cart

  enum status: ["pending", "confirmed", "cancelled", "completed"]

  private

  def destroy_cart
    user.carts.where(product_id: order_lines.pluck(:product_id)).destroy_all
  end

end
