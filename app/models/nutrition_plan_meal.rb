class NutritionPlanMeal < ApplicationRecord
  belongs_to :nutrition_plan
  belongs_to :meal
end
