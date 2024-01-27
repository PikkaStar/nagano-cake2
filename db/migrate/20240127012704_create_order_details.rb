class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :item,foreign_key: true
      t.references :order,foreign_key: true
      t.integer :making_status, null: false, default: 0
      t.integer :amount, null: false
      t.integer :including_tax_price, null: false

      t.timestamps
    end
  end
end
