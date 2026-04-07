class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update]

  def index
    @batches = Batch.order(arrival_date: :desc, created_at: :desc)
  end

  def show
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)

    if @batch.save
      redirect to @batch, notice: "Batch added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @batch.update(batch_params)
      redirect_to @batch, notice: "Batch updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

    private

  def set_batch
    @batch = Batch.find(params[:id])
  end

  def batch_params
    params.require(:batch).permit(
      :batch_code,
      :duck_type,
      :arrival_date,
      :initial_duck_count,
      :estimated_female_count,
      :estimated_male_count,
      :estimated_unknown_count,
      :purchase_price_per_duck,
      :notes
    )
  end
end
