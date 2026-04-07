class FeedPurchase < ApplicationRecord
  belongs_to :feed_product
  has_many :feed_consumptions, dependent: :restrict_with_exception

  validates :purchase_date, presence: true
  validates :quantity_units, presence: true, numericality: { greater_than: 0 }
  validates :unit_cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :total_weight_kg, presence: true, numericality: { greater_than: 0 }
  validates :remaining_weight_kg, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  before_validation :compute_total_cost
  before_validation :default_remaining_weight_kg

  validate :remaining_weight_not_more_than_total

  def compute_total_cost
    self.total_cost = quantity_units.to_f * unit_cost.to_f if quantity_units.present? && unit_cost.present?
  end

  def default_remaining_weight_kg
    self.remaining_weight_kg = total_weight_kg if remaining_weight_kg.blank? && total_weight_kg.present?
  end

  def remaining_weight_not_more_than_total
    return if remaining_weight_kg.blank? || total_weight_kg.blank?

    if remaining_weight_kg.to_f > total_weight_kg.to_f
      errors.add(:remaining_weight_kg, "cannot be greater than total weight")
    end
  end
end
