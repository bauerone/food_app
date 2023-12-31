class NutritionPlan < ApplicationRecord
  belongs_to :user, required: false

  has_many :nutrition_plan_meals, dependent: :destroy
  has_many :meals, through: :nutrition_plan_meals
end
