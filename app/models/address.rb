class Address < ApplicationRecord

  belongs_to :customer, foreign_key: 'customer_id'

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :addresses, presence: true


end
