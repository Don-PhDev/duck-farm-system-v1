class CreateSales < ActiveRecord::Migration[8.1]
  def change
    create_table :sales do |t|
      t.date :sale_date
      t.string :customer_name
      t.string :payment_method
      t.string :reference_no
      t.text :notes

      t.timestamps
    end
  end
end
