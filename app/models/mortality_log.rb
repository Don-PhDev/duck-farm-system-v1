class MortalityLog < ApplicationRecord
  belongs_to :batch

  validates :date, presence: true
  validates :duck_count, presence: true, numericality: { greater_than: 0 }
end
