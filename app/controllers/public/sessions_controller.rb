# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  protected

  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:email]) && (@customer.is_deleted == true)
         redirect_to new_customer_registration
      end
    end
  end
end
