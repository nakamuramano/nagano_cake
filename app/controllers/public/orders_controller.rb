class Public::OrdersController < ApplicationController

    def new
        @order = Order.new
        @customer = current_customer
    end
    def confirm
        @order = Order.new(order_params)
        if params[:order][:address_id] == "1"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

        elsif params[:order][:address_id] == "2"
        ship = Address.find(params[:order][:addresses_id])
        @order.postal_code = ship.postal_code
        @order.address = ship.address
        @order.name = ship.name

        elsif params[:order][:address_id] = "3"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
        else
            render 'new'
        end

        @cart_items = current_customer.cart_items.all
        @order.customer_id = current_customer.id
        @total = 0

    end

    def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save

        current_member.cart_items.each do |cart_item| 
          @ordered_item = OrderedItem.new 
          @ordered_item.item_id = cart_item.item_id 
          @ordered_item.amount = cart_item.amount 
          @ordered_item.order_tax_included_price = (cart_item.item.price*1.08).floor
         
          @ordered_item.order_id =  @order.id 
          @ordered_item.save 
        end 

        current_member.cart_items.destroy_all 
        redirect_to orders_complete_path
    end
    
    def complete
    end

    def index
        @orders = current_custome.orders
    end
    def show
        @order = Order.find(params[:id])
        @ordered_items = @order.ordered_items
    end

    def order_params
      params.require(:order).permit(:name, :postal_code, :address, :post_age, :total_payment, :payment_method)
    end

end

