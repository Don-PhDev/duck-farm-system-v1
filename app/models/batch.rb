class Batch < ApplicationRecord
  has_many :sale_items, dependent: :destroy
  has_many :mortality_logs, dependent: :destroy
  has_many :feed_consumptions, dependent: :destroy
  has_many :expenses, dependent: :nullify

  validates :batch_code, presence: true, uniqueness: true
  validates :bird_type, presence: true
  validates :arrival_date, presence: true
  validates :initial_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_price_per_head, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def total_sold
    sale_items.sum(:quantity)
  end

  def total_dead
    mortality_logs.sum(:quantity)
  end

  def remaining_quantity
    initial_quantity - total_sold - total_dead
  end

  def female_count
    initial_female_count.to_i
  end

  def male_count
    initial_male_count.to_i
  end

  def unknown_count
    initial_unknown_count.to_i
  end

  def mortality_rate
    return 0 if initial_quantity.to_i <= 0

    total_dead.to_f / initial_quantity
  end

  def purchase_cost_total
    initial_quantity.to_i * purchase_price_per_head.to_f
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
    purchase_cost_total + feed_cost_total + direct_expenses_total
  end

  def gross_profit
    revenue_total - direct_cost_total
  end
end
