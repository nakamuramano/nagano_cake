class Public::CartItemsController < ApplicationController

  def index
       @cart_items = CartItem.all
  end

  def create
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
     @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
       if cart_item.item_id == @cart_item.item_id
          new_amount = cart_item.amount + @cart_item.amount
          cart_item.update_attribute(:amount, new_amount)

       end
      end

        @cart_item.save
        redirect_to cart_items_path

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to '/cart_items'
  end

  def destroy
      @cart_item_destroy = CartItem.find(params[:id])
      @cart_item_destroy.destroy
      redirect_to '/cart_items'
  end

  def destroy_all
      @cart_items_destroy_all = CartItem.all
      @cart_items_destroy_all.destroy
      redirect_to '/items'
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
