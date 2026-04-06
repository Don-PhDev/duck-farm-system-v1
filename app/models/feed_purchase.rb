class FeedPurchase < ApplicationRecord
  belongs_to :feed_product
  has_many :feed_consumptions, dependent: :restrict_with_exception

  validates :purchase_date, presence: true
  validates :quantity_units, numericality: { greater_than: 0 }, allow_nil: true
  validates :unit_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :total_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :total_weight_kg, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :remaining_weight_kg, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
