class NutritionPlan < ApplicationRecord
  belongs_to :user, required: false

  has_many :nutrition_plan_meals
  has_many :meals, through: :nutrition_plan_meals
end
