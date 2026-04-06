class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :batch

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price_per_head, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
