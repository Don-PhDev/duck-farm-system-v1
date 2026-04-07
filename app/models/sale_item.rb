class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :batch

  SALE_UNITS = %w[head kg].freeze

  validates :sale_unit, presence: true, inclusion: { in: SALE_UNITS }
  validates :price_per_duck, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :duck_count, numericality: { greater_than: 0 }, if: :head_sale?
  validates :weight_kg, numericality: { greater_than: 0 }, if: :kg_sale?
  validates :age_at_sale_days, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  before_validation :set_default_sale_unit
  before_validation :compute_total_amount
  before_validation :compute_age_at_sale_days

  def head_sale?
    sale_unit == "head"
  end

  def kg_sale?
    sale_unit == "kg"
  end

  def set_default_sale_unit
    self.sale_unit ||= "head"
  end

  def compute_total_amount
    self.total_amount =
      if kg_sale?
        weight_kg.to_f * price_per_duck.to_f
      else
        duck_count.to_i * price_per_duck.to_f
      end
  end

  def compute_age_at_sale_days
    return unless sale&.sale_date && batch&.arrival_date

    self.age_at_sale_days = [(sale.sale_date - batch.arrival_date).to_i, 0].max
  end
end
