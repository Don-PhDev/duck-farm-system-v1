class CreateSaleItems < ActiveRecord::Migration[8.1]
  def change
    create_table :sale_items do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true
      t.integer :duck_count
      t.decimal :price_per_duck
      t.integer :age_at_sale_days
      t.decimal :total_amount

      t.timestamps
    end
  end
end
