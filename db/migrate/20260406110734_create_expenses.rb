class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses do |t|
      t.date :date
      t.string :category
      t.string :description
      t.decimal :amount
      t.references :batch, null: false, foreign_key: true
      t.boolean :is_direct_cost
      t.text :notes

      t.timestamps
    end
  end
end
