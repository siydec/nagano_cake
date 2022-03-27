class CartItem < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id'
  belongs_to :item, foreign_key: 'item_id'

  validates :item_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true



  def add_tax_price_cart
        (item.price * 1.1).round
  end

  def subtotal
    add_tax_price_cart * amount
  end






end
