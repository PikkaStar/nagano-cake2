class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  validates :total, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :payment_method, presence: true
  validates :order_status, presence: true

end
