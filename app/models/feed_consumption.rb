class FeedConsumption < ApplicationRecord
  belongs_to :batch
  belongs_to :feed_product
  belongs_to :feed_purchase
end
