class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @item = OrderDetail.find(params[:id]).item
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:amount, :tax_included_price)
  end

end
