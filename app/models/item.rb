class Item < ApplicationRecord
  has_one_attached :image
  validates :is_active, inclusion: { in: [true, false] }
  belongs_to :genre

end
