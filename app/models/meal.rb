class Meal < ApplicationRecord
  belongs_to :nutrition_plan, required: false

  has_many :meal_products
  has_many :products, through: :meal_products

  enum category: %i[breakfast lunch dinner snack]
end
