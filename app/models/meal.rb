class Meal < ApplicationRecord
  belongs_to :nutrition_plan, required: false

  has_many :meal_products
  has_many :products, through: :meal_products

  has_many :nutrition_plan_meals
  has_many :nutrition_plan, through: :nutrition_plan_meals

  enum category: %i[breakfast lunch dinner snack]
end
