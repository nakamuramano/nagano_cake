class Public::CartItemsController < ApplicationController

  def index
        @cart_items = CartItem.page(params[:page])
  end
end
