class Order < ApplicationRecord
   has_many :order_items, dependent: :destroy
   belongs_to :customer
   
   enum payment_method: { credit_card: 0, transfer: 1 }
   enum order_status: { waiting: 0, payment: 1, production: 2, preparation: 3, shipping: 4 }
   
end
