class RefineBatchFields < ActiveRecord::Migration[8.1]
  def change
    add_index :batches, :batch_code, unique: true unless index_exists?(:batches, :batch_code)
    add_index :batches, :duck_type unless index_exists?(:batches, :duck_type)
    add_index :sales, :sale_date unless index_exists?(:sales, :sale_date)
    add_index :mortality_logs, :date unless index_exists?(:mortality_logs, :date)
    add_index :feed_purchases, :purchase_date unless index_exists?(:feed_purchases, :purchase_date)
    add_index :feed_consumptions, :date unless index_exists?(:feed_consumptions, :date)
    add_index :expenses, :date unless index_exists?(:expenses, :date)

    change_column_default :expenses, :is_direct_cost, from: nil, to: false if column_exists?(:expenses, :is_direct_cost)
    change_column_default :sale_items, :sale_unit, from: nil, to: "head" if column_exists?(:sale_items, :sale_unit)
  end
end
