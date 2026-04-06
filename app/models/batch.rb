class Batch < ApplicationRecord
  has_many :sale_items, dependent: :destroy
  has_many :mortality_logs, dependent: :destroy
  has_many :feed_consumptions, dependent: :destroy
  has_many :expenses, dependent: :nullify

  validates :batch_code, presence: true, uniqueness: true
  validates :duck_type, presence: true
  validates :arrival_date, presence: true
  validates :initial_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_price_per_head, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
