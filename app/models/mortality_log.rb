class MortalityLog < ApplicationRecord
  belongs_to :batch

  validates :date, presence: true
  validates :duck_count, presence: true, numericality: { greater_than: 0 }

  validates :estimated_female_count, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :estimated_male_count, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :estimated_unknown_count, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  validate :gender_counts_not_exceed_total

  private

  def gender_counts_not_exceed_total
    total_gender =
      estimated_female_count.to_i +
      estimated_male_count.to_i +
      estimated_unknown_count.to_i

    return if total_gender == 0 # allow no gender breakdown

    if total_gender > duck_count.to_i
      errors.add(:base, "Gender counts cannot exceed total duck count")
    end
  end
end
