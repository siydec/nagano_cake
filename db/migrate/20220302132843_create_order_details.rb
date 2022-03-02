class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps
      t.integer :purchase_price
      t.integer :amount
      t.integer :making_status
    end
  end
end
