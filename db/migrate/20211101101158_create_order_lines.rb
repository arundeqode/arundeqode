class CreateOrderLines < ActiveRecord::Migration[6.1]
  def change
    create_table :order_lines do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :price
      t.integer :status
      t.datetime :expected_delivery_date
      t.integer :qty

      t.timestamps
    end
  end
end
