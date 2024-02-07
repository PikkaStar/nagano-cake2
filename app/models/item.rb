class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  validates :name, presence: true
  validates :description, presence: true
  validates :excluding_tax_price, presence: true

  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
      "no_image"
    end
  end

  def tax_price
    (excluding_tax_price * 1.1).to_i
  end

end
