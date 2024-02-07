class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :amount, presence: true

   def tax_included_price
      item.excluding_tax_price * 1.10
   end

   def subtotal
    tax_included_price * amount
   end

  def self.find_for_user_and_item(user_id, item_id)
    find_by(user_id: user_id, item_id: item_id)
  end

  def self.update_or_create(user_id, item_id, amount)
    cart_item = find_for_user_and_item(user_id, item_id)
    if cart_item
      cart_item.update(amount: cart_item.amount.to_i + amount.to_i)
    else
      create(user_id: user_id, item_id: item_id, amount: amount)
    end
  end

end
