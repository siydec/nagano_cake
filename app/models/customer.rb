class Customer < ApplicationRecord

  has_many :cart_items
  has_many :orders
  has_many :addresses

  with_options presence: true do

    validates :last_name
    validates :first_name
    validates :last_name_lana
    validates :first_name_kana
    validates :email
    validates :postal_code
    validates :address
    validates :telephone_number

  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
