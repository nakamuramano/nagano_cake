class Admin::OrderDetailsController < ApplicationController

  def show

  end

    private

  def order_params
    params.require(:order_detail).permit(:amount, :tax_included_price)
  end

end
