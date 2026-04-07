class RefineFeedProductFields < ActiveRecord::Migration[8.1]
  def change
    rename_column :feed_products, :feed_type, :feed_stage if column_exists?(:feed_products, :feed_type)
  end
end
