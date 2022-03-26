class Order < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id'
  has_many :order_details, foreign_key: 'customer_id'


  enum payment: { credit_card: 0, transfer: 1}
  enum status: { wait: 0, confirmation: 1, production: 2, shipment: 3, complete: 4}

   with_options presence: true do
     validates :customer_id
     validates :billing_amount
     validates :postage
     validates :delivery_postal_code
     validates :delivery_address
     validates :delivery_name
     validates :payment
     validates :status

   end

def address_display_order
    '〒' + delivery_postal_code.to_s + '' + delivery_address + '' + delivery_name
end

def postage
    800
end





end
