class Agreement < ApplicationRecord
  validates :service_name, presence: true, length: { maximum: 30 }
  # validates :price, presence: true, inclusion: { in: 0..9 }

  belongs_to :user
end
