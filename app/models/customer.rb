class Customer < ApplicationRecord

  has_many :cart_items
  has_many :orders
  has_many :addresses

  with_options presence: true do

    validates :last_name
    validates :first_name
    validates :last_name_kana
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

def address_display_customer
  '〒' + self.postal_code + '' + self.address + '' + self.last_name + '' + self.first_name
end

def full_name
      self.last_name + self.first_name
end

def full_name_kana
  self.last_name_kana + self.first_name_kana
end




end
