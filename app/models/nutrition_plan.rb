class NutritionPlan < ApplicationRecord
  belongs_to :user, required: false

  has_many :meals
end
