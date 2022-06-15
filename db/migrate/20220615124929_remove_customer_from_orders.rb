class RemoveCustomerFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :customer, :integer
  end
end
