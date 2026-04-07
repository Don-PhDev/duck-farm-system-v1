class FeedConsumption < ApplicationRecord
  belongs_to :batch
  belongs_to :feed_product
  belongs_to :feed_purchase

  validates :date, presence: true
  validates :quantity_kg, presence: true, numericality: { greater_than: 0 }
  validates :cost_per_kg, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :total_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  before_validation :compute_total_cost
  validate :feed_product_matches_purchase

  def compute_total_cost
    self.total_cost = quantity_kg.to_f * cost_per_kg.to_f
  end

  def feed_product_matches_purchase
    return unless feed_purchase && feed_product

    errors.add(:feed_product_id, "must match selected feed purchase") if feed_purchase.feed_product_id != feed_product_id
  end
end
