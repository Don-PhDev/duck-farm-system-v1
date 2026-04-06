class FeedConsumption < ApplicationRecord
  belongs_to :batch
  belongs_to :feed_product
  belongs_to :feed_purchase

    validates :date, presence: true
  validates :quantity_kg, presence: true, numericality: { greater_than: 0 }
  validates :cost_per_kg, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :total_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
