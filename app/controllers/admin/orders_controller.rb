class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @orders = @order.cuatomer
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:amount, :tax_included_price)
  end

end
