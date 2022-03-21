class Order < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id'
  has_many :order_details, foreign_key: 'customer_id'


  enum payment_method: { credit_card: 0, transfer: 1}

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
   
   
   



end
