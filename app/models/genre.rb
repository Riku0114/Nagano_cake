class Genre < ApplicationRecord
   has_many :items, dependent: :destroy
   # validates :, inclusion: { in: [true, false] }
end
