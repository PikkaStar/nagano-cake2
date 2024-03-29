class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
