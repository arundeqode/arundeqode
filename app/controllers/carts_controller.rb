class CartsController < ApplicationController
	before_action :authenticate_user!
  before_action :check_added_product

	def create
    unless @cart_item.present?
      cart = current_user.carts.new(cart_params)
      if cart.save
        redirect_to '/', :flash => { :notice => "Suceesssfully added in cart." }
      else
        flash[:alert] = cart.errors.full_messages
        redirect_to '/'
      end
    else
      flash[:notice] = "Suceesssfully added in cart."
      redirect_to '/'
    end
  end
  def index
  	@carts = current_user.carts
  end

  protected

  def cart_params
    params.permit(:product_id, :qty)
  end

  def check_added_product
    @cart_item = current_user.carts.find_by(product_id: cart_params[:product_id])
    if @cart_item.present?
      unless @cart_item.update(qty: @cart_item.qty.to_i+1)
        flash[:alert] = @cart_item.errors.full_messages.join(',')
        redirect_to '/'
      end
    end
  end

end
