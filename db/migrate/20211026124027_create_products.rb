class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :stock_qty
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
