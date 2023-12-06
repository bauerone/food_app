class FoodPreferenceProduct < ApplicationRecord
  belongs_to :food_preference
  belongs_to :product

  enum status: %i[positive negative]
end
