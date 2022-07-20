class Admin::CustomersController < ApplicationController
  def index
    @admin_customer = Customer.page(params[:page]).per(10)
  end

  def show
    @admin_customer = Customer.find(params[:id])
  end

  def edit
    @admin_customer = Customer.find(params[:id])
  end

  def update
    @admin_customer = Customer.find(params[:id])
    if@admin_customer.update(customer_params)
      redirect_to admin_customer_show_path(@admin_customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)

  end

end
