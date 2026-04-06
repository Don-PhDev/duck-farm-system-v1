class CreateFeedProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :feed_products do |t|
      t.string :name
      t.string :brand
      t.string :feed_type
      t.string :unit

      t.timestamps
    end
  end
end
