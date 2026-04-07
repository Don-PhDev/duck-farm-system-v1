class RefineMortalityGenderFields < ActiveRecord::Migration[8.1]
  def change
    rename_column :mortality_logs, :female_count, :estimated_female_count
    rename_column :mortality_logs, :male_count, :estimated_male_count
    rename_column :mortality_logs, :unknown_count, :estimated_unknown_count
  end
end
