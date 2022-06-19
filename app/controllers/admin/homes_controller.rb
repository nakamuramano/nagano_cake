class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  private

end
