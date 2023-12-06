class Product < ApplicationRecord
  has_many :meal_products
  has_many :meals, through: :meal_products

  has_many :food_preference_products
  has_many :food_preferences, through: :food_preference_products
end
