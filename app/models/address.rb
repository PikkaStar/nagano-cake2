class Address < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :shipping_address, presence: true
  validates :postal_code, presence: true
end
