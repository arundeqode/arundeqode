class OrdersController < ApplicationController
	before_action :authenticate_user!

	def create
		order = current_user.orders.new(status: 'pending')
  	params[:cart_ids].each do |cart_id|
  		cart = Cart.find(cart_id)
  		order_line = OrderLine.new(product: cart.product, price: cart.product.price, qty: cart.qty, status: 'pending')
  	 	order.order_lines << order_line
    end
    order.total_price = order.order_lines.sum(&:price)
    if order.save
    	flash[:notice] = "Suceesssfully ordered."
  		redirect_to '/'
    else
    	flash[:alert] = order.errors.full_messages.join(",")
  		redirect_to '/'
    end	  
  end

end
