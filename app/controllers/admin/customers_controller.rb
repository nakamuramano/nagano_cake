class Admin::CustomersController < ApplicationController
  def index
    @admin_customer = Customer.page(params[:page])
  end

  def show
    @admin_customer = Customer.find(params[:id])
  end

  def edit
    @admin_customer = Customer.find(params[:id])
  end

  def update
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)

  end

end
