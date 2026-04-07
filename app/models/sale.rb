class Sale < ApplicationRecord
  has_many :sale_items, dependent: :destroy
  accepts_nested_attributes_for :sale_items, allow_destroy: true, reject_if: :all_blank

  PAYMENT_METHODS = %w[cash gcash bank_transfer cod].freeze

  validates :sale_date, presence: true
  validates :payment_method, inclusion: { in: PAYMENT_METHODS }, allow_blank: true
end
