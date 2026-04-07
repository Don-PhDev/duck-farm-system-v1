class RefineSaleItemFields < ActiveRecord::Migration[8.1]
  def change
    add_column :sale_items, :sale_unit, :string unless column_exists?(:sale_items, :sale_unit)
    add_column :sale_items, :weight_kg, :decimal, precision: 10, scale: 2 unless column_exists?(:sale_items, :weight_kg)
  end
end
