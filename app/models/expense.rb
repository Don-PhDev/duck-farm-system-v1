class Expense < ApplicationRecord
  belongs_to :batch, optional: true

  validates :date, presence: true
  validates :category, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
