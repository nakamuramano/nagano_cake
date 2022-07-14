class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total = 0
    @post_age = 800

    @order = Order.new(order_params)
    if params[:order][:address_id] == "1"
       @order.name = current_customer.last_name + current_customer.first_name
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
    elsif @address = Address.find(params[:order][:address_id]) == "2"
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    elsif params[:order][:address_id] == "3"
    end
  end


  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.order_amount = cart.amount
      order_item.order_tax_included_price = cart.item.price
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
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.customer_address
    elsif params[:order][:address_id] == "2"
     if Address.exists?(name: params[:order][:address_id])
        @order.name = Address.find(params[:order][:address_id]).name
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
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



  private


   def order_params
     params.require(:order).permit(:name, :postal_code, :address, :post_age, :total_payment, :payment_method)
   end

end

