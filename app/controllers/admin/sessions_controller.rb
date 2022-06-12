# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController

  def new
    @session = Admin.new
  end

  def create
    session = Admin.new(admin_params)
    session.save
    redirect_to '/admin'
  end

  def destroy
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :encrypted_password)
  end
end
