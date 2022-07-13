class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.order_quantity = cart.quantity
      order_item.order_price = cart.item.price
    end
    order_item.save
    cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end

 　　 @order = Order.new(order_params)
    if params[:order][:address_id] == "1"
       @order.name = current_customer.name
       @order.address = current_customer.customer_address
    elsif params[:order][:address_id] == "2"
     if Address.exists?(name: params[:order][:address_id])
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
     else
        render :post

     end
     elsif params[:order][:address_id] == "3"
       address_new = current_customer.addresses.new(order_params)
     if address_new.save
     else
        @order = Order.new(order_params)
        render :post
     end
    end
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total = 0
    @post_age = 800
    @customer = current_customer

    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name


  end

  private


   def order_params
     params.require(:order).permit(:name, :postal_code, :address, :post_age, :total_payment, :payment_method)
   end

end
