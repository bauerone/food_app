class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_one :food_preference
  has_many :nutrition_plans
  has_many :weight_measures

  def current_weight
    weight_measures.last&.weight
  end

  def favourite_products
    food_preference.products.where('food_preference_products.status = ?', FoodPreferenceProduct.statuses[:positive])
  end

  def blocked_products
    food_preference.products.where('food_preference_products.status = ?', FoodPreferenceProduct.statuses[:negative])
  end
end
