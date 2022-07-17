class RemoveCustomerIdFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :costomer_id, :integer

  end
end
