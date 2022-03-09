class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, foreign_key: 'genre_id'
  has_many :cart_items
  has_many :order_details

 with_options presence: true do

     validates :name
     validates :introduction
     validates :price


   end



  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def add_tax_price
        (self.price * 1.1).round
  end


end
