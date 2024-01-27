class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :making_status, presence: true
  validates :amount, presence: true
  validates :including_tax_price, presence: true

end
