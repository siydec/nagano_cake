class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :billing_amount
      t.integer :postage
      t.integer :delivery_postal_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :payment
      t.integer :status
    end
  end
end
