class CreateFeedPurchases < ActiveRecord::Migration[8.1]
  def change
    create_table :feed_purchases do |t|
      t.references :feed_product, null: false, foreign_key: true
      t.date :purchase_date
      t.decimal :quantity_units
      t.decimal :unit_cost
      t.decimal :total_cost
      t.decimal :total_weight_kg
      t.decimal :remaining_weight_kg
      t.string :supplier_name
      t.text :notes

      t.timestamps
    end
  end
end
