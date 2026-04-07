class Expense < ApplicationRecord
  belongs_to :batch, optional: true

  CATEGORIES = [
    "feeds",
    "grain",
    "medicine",
    "equipment",
    "utilities",
    "labor",
    "transport",
    "maintenance",
    "supplies",
    "other"
  ].freeze

  validates :date, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
end
