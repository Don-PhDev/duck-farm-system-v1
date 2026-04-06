class MortalityLog < ApplicationRecord
  belongs_to :batch

  validates :date, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
