class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :shipping, default: 800
      t.integer :payment_method, null: false, default: 0
      t.integer :total, null: false
      t.integer :order_status, null: false, default: 0
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
