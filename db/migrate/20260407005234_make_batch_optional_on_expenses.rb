class MakeBatchOptionalOnExpenses < ActiveRecord::Migration[8.1]
  def change
    change_column_null :expenses, :batch_id, true
  end
end
