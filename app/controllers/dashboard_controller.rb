class DashboardController < ApplicationController
  def index
    @batch_count = Batch.count
    @active_batches = Batch.all.select { |batch| batch.remaining_ducks > 0 }
    @total_remaining_ducks = Batch.all.sum(&:remaining_ducks)
    @total_revenue = Batch.all.sum(&:revenue_total)
    @total_direct_cost = Batch.all.sum(&:direct_cost_total)
    @total_gross_profit = Batch.all.sum(&:gross_profit)
  end
end
