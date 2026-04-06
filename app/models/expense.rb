class Expense < ApplicationRecord
  belongs_to :batch, optional: true


  feeds, grain, medicine, equipment, utilities, labor, transport, maintenance, supplies
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
  validates :category, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
