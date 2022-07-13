class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
 　　 @order = Order.new(order_params)
    if params[:address_display] == "1"
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
        render :post
     end
    end
  end
  
  def confirm
    @order = Order.new(order_params)
    binding.pry 
  end

  private


   def order_params
     params.require(:order).permit(:name, :postal_code, :address, :post_age, :total_payment, :payment_method)
   end

end
