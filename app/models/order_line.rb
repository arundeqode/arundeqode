class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validate :check_product_qty
  after_create :correct_product_qty

  enum status: ["pending", "confirmed", "cancelled", "completed"]

  private

  def check_product_qty
    if qty > product.stock_qty 
      errors.add(:base, "#{product.name} is out of stock")
    end 
  end

  def correct_product_qty
    product.update(stock_qty: product.stock_qty-qty)
  end

end
