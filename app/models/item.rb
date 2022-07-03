class Item < ApplicationRecord
  has_one_attached :image
  validates :is_active, inclusion: { in: [true, false] }
  belongs_to :genre


  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  def with_tax_price
    (price*1.1).floor
  end

  def subtotal
    item.with_tax_price*amount
  end

  def get_image(width,height)
    image.variant(resize_to_limit: [width,height]).processed
  end
end
