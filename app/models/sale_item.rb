class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :batch

  SALE_UNITS = %w[head kg].freeze

  validates :duck_count, numericality: { greater_than: 0 }, allow_nil: true
  validates :price_per_duck, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :weight_kg, numericality: { greater_than: 0 }, allow_nil: true
  validates :sale_unit, inclusion: { in: SALE_UNITS }

  before_validation :set_default_sale_unit
  before_validation :compute_total_amount
  before_validation :compute_age_at_sale_days

  def set_default_sale_unit
    self.sale_unit ||= "head"
  end

  def compute_total_amount
    self.total_amount =
      if sale_unit == "kg"
        weight_kg.to_f * price_per_duck.to_f
      else
        duck_count.to_i * price_per_duck.to_f
      end
  end

  def compute_age_at_sale_days
    return unless sale&.sale_date && batch&.arrival_date

    self.age_at_sale_days = (sale.sale_date - batch.arrival_date).to_i
  end
end
