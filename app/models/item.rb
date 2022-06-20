class Item < ApplicationRecord
  has_one_attached :image
  validates :is_active, inclusion: { in: [true, false] }
  belongs_to :genre

  has_many :carat_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
end
