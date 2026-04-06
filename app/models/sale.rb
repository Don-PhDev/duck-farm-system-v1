class Sale < ApplicationRecord
  has_many :sale_items, dependent: :destroy

  validates :sale_date, presence: true
end
