class ChangeColoumnDefaultToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column_default :order_details, :making_status, to: "0"
  end
end
