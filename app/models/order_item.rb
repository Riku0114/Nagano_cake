class OrderItem < ApplicationRecord
   belongs_to :item
   belongs_to :order

   enum production_status: { cannot_start: 0, waiting: 1, production: 2, completion: 3, }

   def with_tax_price
    (purchase_price * 1.1).floor
   end

end
