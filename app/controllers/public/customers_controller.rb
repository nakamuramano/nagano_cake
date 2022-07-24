class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
   private
   

end
