class OrderDetail < ApplicationRecord
  belongs_to :order, foreign_key: 'item_id'
  belongs_to :item, foreign_key: 'order_id'

  




end
