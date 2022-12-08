class OrderItem < ApplicationRecord
   belongs_to :item
   belongs_to :order

   enum production_status: { cannot_start: 0, waiting: 1, production: 2, completion: 3, }
end
