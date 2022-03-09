class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

   with_options presence: true do
     validates :billing_amount
     validates :postage
     validates :delivery_postal_code
     validates :delivery_address
     validates :delivery_name
     validates :payment
     validates :status
   end

end
