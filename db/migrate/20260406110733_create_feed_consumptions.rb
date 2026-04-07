class CreateFeedConsumptions < ActiveRecord::Migration[8.1]
  def change
    create_table :feed_consumptions do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :feed_product, null: false, foreign_key: true
      t.references :feed_purchase, null: false, foreign_key: true
      t.date :date
      t.decimal :quantity_kg
      t.decimal :cost_per_kg
      t.decimal :total_cost
      t.text :notes

      t.timestamps
    end
  end
end
