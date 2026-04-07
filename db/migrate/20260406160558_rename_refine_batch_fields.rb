class RenameRefineBatchFields < ActiveRecord::Migration[8.1]
  def change
    rename_column :batches, :bird_type, :duck_type if column_exists?(:batches, :bird_type)
    rename_column :batches, :initial_quantity, :initial_duck_count if column_exists?(:batches, :initial_quantity)
    rename_column :batches, :initial_female_count, :estimated_female_count if column_exists?(:batches, :initial_female_count)
    rename_column :batches, :initial_male_count, :estimated_male_count if column_exists?(:batches, :initial_male_count)
    rename_column :batches, :initial_unknown_count, :estimated_unknown_count if column_exists?(:batches, :initial_unknown_count)
    rename_column :batches, :purchase_price_per_head, :purchase_price_per_duck if column_exists?(:batches, :purchase_price_per_head)
  end
end
