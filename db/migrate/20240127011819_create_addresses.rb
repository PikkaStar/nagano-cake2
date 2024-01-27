class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :shipping_address, null: false
      t.string :postal_code, null: false

      t.timestamps
    end
  end
end
