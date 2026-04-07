class FeedProduct < ApplicationRecord
  has_many :feed_purchases, dependent: :restrict_with_exception
  has_many :feed_consumptions, dependent: :restrict_with_exception

  FEED_STAGES = %w[starter grower finisher layer mixed other].freeze
  UNITS = %w[kg bag sack].freeze

  validates :name, presence: true
  validates :feed_stage, inclusion: { in: FEED_STAGES }, allow_blank: true
  validates :unit, inclusion: { in: UNITS }, allow_blank: true
end
