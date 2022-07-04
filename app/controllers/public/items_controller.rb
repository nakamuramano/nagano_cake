class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = @item.cart_items
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end 

end
