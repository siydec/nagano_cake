class RemovePaymentFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :payment, :integer
  end
end
