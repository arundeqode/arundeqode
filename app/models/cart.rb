class Cart < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validate :check_product_qty

	private

	def check_product_qty
		if qty > product.stock_qty 
			errors.add(:base, "#{product.name} is out of stock")
		end 
	end
end
