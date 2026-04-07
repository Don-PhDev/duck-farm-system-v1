class SalesController < ApplicationController
  before_action :set_sale, only: [:show]

  def index
    @sales = Sale.includes(:sale_items).order(sale_date: :desc, created_at: :desc)
  end

  def show
  end

  def new
    @sale = Sale.new(sale_date: Date.current)
    @sale.sale_items.build(sale_unit: "head")
    load_batches
  end

  def create
    @sale = Sale.new(sale_params)
    load_batches

    if @sale.save
      redirect_to @sale, notice: "Sale recorded successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def load_batches
    @batches = Batch.order(arrival_date: :desc, batch_code: :asc)
  end

  def sale_params
    params.require(:sale).permit(
      :sale_date,
      :customer_name,
      :payment_method,
      :reference_no,
      :notes,
      sale_items_attributes: [
        :id,
        :batch_id,
        :duck_count,
        :price_per_duck,
        :sale_unit,
        :weight_kg,
        :_destroy
      ]
    )
  end
end
