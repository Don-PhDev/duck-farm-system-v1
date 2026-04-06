class FeedProduct < ApplicationRecord
  has_many :feed_purchases, dependent: :destroy
  has_many :feed_consumptions, dependent: :nullify

  validates :name, presence: true
end
