class AddCustomerIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :cuatomer, :integer
  end
end
