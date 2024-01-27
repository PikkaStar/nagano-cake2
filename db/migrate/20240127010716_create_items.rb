class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :excluding_tax_price, null: false
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
