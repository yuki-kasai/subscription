class Agreement < ApplicationRecord
  validates :service_name, presence: true, length: { maxinum: 30 }
  validates :price, presence: true, inclusion: { in: 0..9 }
end
