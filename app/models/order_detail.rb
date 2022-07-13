class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :items

  enum payment_method: { credit_card: 0, transfer: 1 }

end
