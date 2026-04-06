class CreateBatches < ActiveRecord::Migration[8.1]
  def change
    create_table :batches do |t|
      t.string :batch_code
      t.string :duck_type
      t.date :arrival_date
      t.integer :initial_duck_count
      t.integer :initial_female_count
      t.integer :initial_male_count
      t.integer :initial_unknown_count
      t.decimal :purchase_price_per_duck
      t.text :notes

      t.timestamps
    end
  end
end
