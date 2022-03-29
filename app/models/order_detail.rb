class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item, foreign_key: 'item_id'

  enum making_status: { no_making: 0, wait: 1, production: 2, complete: 3}


def price_total
  self.purchase_price * self.amount
end


end
