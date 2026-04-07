class Batch < ApplicationRecord
  has_many :sale_items, dependent: :restrict_with_exception
  has_many :mortality_logs, dependent: :destroy
  has_many :feed_consumptions, dependent: :destroy
  has_many :expenses, dependent: :nullify

  DUCK_TYPES = %w[PEKN ITIK MSCV].freeze

  validates :batch_code, presence: true, uniqueness: true
  validates :duck_type, presence: true, inclusion: { in: DUCK_TYPES }
  validates :arrival_date, presence: true
  validates :initial_duck_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_price_per_duck, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def ducks_sold
    #sale_items.sum(:duck_count)
    sale_items.where(sale_unit: "head").sum(:duck_count)
  end

  def total_weight_sold
    sale_items.where(sale_unit: "kg").sum(:weight_kg)
  end

  def ducks_dead
    mortality_logs.sum(:duck_count)
  end

  def remaining_ducks
    initial_duck_count.to_i - ducks_sold - ducks_dead
  end

  def female_count
    estimated_female_count.to_i
  end

  def male_count
    estimated_male_count.to_i
  end

  def unknown_count
    estimated_unknown_count.to_i
  end

  def mortality_rate
    return 0.0 if initial_duck_count.to_i <= 0

    ducks_dead.to_f / initial_duck_count
  end

  def stock_cost_total
    initial_duck_count.to_i * purchase_price_per_duck.to_f
  end

  def feed_cost_total
    feed_consumptions.sum(:total_cost)
  end

  def direct_expenses_total
    expenses.where(is_direct_cost: true).sum(:amount)
  end

  def revenue_total
    sale_items.sum(:total_amount)
  end

  def direct_cost_total
    stock_cost_total + feed_cost_total + direct_expenses_total
  end

  def gross_profit
    revenue_total - direct_cost_total
  end

  def cost_per_duck
    return 0.0 if initial_duck_count.to_i <= 0

    direct_cost_total / initial_duck_count
  end
end
