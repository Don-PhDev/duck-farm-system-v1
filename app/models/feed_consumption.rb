class FeedConsumption < ApplicationRecord
  belongs_to :batch
  belongs_to :feed_product
  belongs_to :feed_purchase

  validates :date, presence: true
  validates :quantity_kg, presence: true, numericality: { greater_than: 0 }
  validates :cost_per_kg, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :total_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  before_validation :default_cost_per_kg_from_purchase
  before_validation :compute_total_cost

  validate :feed_product_matches_purchase
  validate :quantity_does_not_exceed_remaining_feed

  def compute_total_cost
    self.total_cost = quantity_kg.to_f * cost_per_kg.to_f
  end

  def default_cost_per_kg_from_purchase
    return if cost_per_kg.present?
    return unless feed_purchase&.total_weight_kg.present? && feed_purchase.total_weight_kg.to_f > 0

    self.cost_per_kg = feed_purchase.total_cost.to_f / feed_purchase.total_weight_kg.to_f
  end

  def feed_product_matches_purchase
    return unless feed_purchase && feed_product

    if feed_purchase.feed_product_id != feed_product_id
      errors.add(:feed_product_id, "must match selected feed purchase")
    end
  end

  def quantity_does_not_exceed_remaining_feed
    return unless feed_purchase && quantity_kg.present?

    if quantity_kg.to_f > feed_purchase.remaining_weight_kg.to_f
      errors.add(:quantity_kg, "cannot exceed remaining feed stock from selected purchase")
    end
  end
end
