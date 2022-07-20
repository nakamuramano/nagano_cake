class Order < ApplicationRecord

    has_many :order_details, dependent: :destroy
    belongs_to :customer
    has_many :items, through: :order_details

    enum payment_method: { credit_card: 0, transfer: 1 }

   def order_detail
    @amount = 0
    self.order_details.each do |order|
      @amount += order.amount
    end
     return @amount
   end

end
