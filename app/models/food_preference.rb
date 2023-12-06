class FoodPreference < ApplicationRecord
  belongs_to :user

  has_many :food_preference_products
  has_many :products, through: :food_preference_products
end
