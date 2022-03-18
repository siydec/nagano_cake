class CartItem < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id'
  belongs_to :item, foreign_key: 'item_key'

  validates :item_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true


end
