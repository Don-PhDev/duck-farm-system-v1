class Sale < ApplicationRecord
  has_many :sale_items, dependent: :destroy

  validates :sale_date, presence: true

  PAYMENT_METHODS = %w[cash gcash bank_transfer cod].freeze
end
