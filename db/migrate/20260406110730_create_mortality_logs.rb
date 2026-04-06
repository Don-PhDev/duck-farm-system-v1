class CreateMortalityLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :mortality_logs do |t|
      t.references :batch, null: false, foreign_key: true
      t.date :date
      t.integer :duck_count
      t.integer :male_count
      t.integer :female_count
      t.integer :unknown_count
      t.string :cause
      t.text :notes

      t.timestamps
    end
  end
end
