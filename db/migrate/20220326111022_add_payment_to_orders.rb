class AddPaymentToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :payment, :integer, default: 0
  end
end
