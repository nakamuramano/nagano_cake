class Admin::OrderDetailsController < ApplicationController

  def update
  end

    private

  def order_params
    params.require(:order_detail).permit(:amount, :tax_included_price)
  end

end
