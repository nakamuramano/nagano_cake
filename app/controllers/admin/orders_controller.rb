class Admin::OrdersController < ApplicationController
  
  def show
    @order_detail = OrderDetail.find(params[:id])
    @order = current_user.order_id
    @total = 0
  end
  
  private
  
  def order_params
    params.require(:or_detail).permit(:amount, :tax_included_price)
  end 

end
