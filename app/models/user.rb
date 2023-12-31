class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_one :food_preference
  has_many :nutrition_plans
  has_many :weight_measures
  has_many :meals

  after_create :create_food_preference

  def current_weight
    weight_measures.last&.weight
  end

  def favourite_products
    food_preference.products.where('food_preference_products.status = ?', FoodPreferenceProduct.statuses[:positive])
  end

  def blocked_products
    food_preference.products.where('food_preference_products.status = ?', FoodPreferenceProduct.statuses[:negative])
  end

  def target_calories
    food_preference.target_calories
  end

  def calculate_nutrition_plan
    self.nutrition_plans.destroy_all

    combinations = find_combinations

    (Date.today.beginning_of_week..Date.today.end_of_week).map do |day|
      plan_for_day = closest(combinations, target_calories)

      if plan_for_day
        combinations.delete(plan_for_day)
      else
        combinations = find_combinations
        plan_for_day = closest(combinations, target_calories)
      end

      plan = NutritionPlan.create!(user: self, name: day, day_of_reception: day, description: 'Автоматически созданный план питания')
      plan_for_day.first.each do |meal_id|
        NutritionPlanMeal.create!(nutrition_plan: plan, meal_id: meal_id)
      end
    end
  end

  def nutrition_plans_for_current_week
    days_from_this_week = (Date.today.at_beginning_of_week..Date.today.at_end_of_week)
    self.nutrition_plans.where(day_of_reception: days_from_this_week)
  end

  private

  def find_combinations
    breakfast = find_meals(:breakfast)
    lunch = find_meals(:lunch)
    dinner = find_meals(:dinner)

    combinations = lunch.product(dinner).product(breakfast).map { |arr| arr.flatten.each_slice(2).to_a }
                                                           .map { |arr| [arr.map { |a| a.first }, arr.sum { |meal| meal.second }] }
  end

  def closest(data, target)
    return nil if data.empty?
    data.min_by  { |e| e.last <= target ? [0, target-e.last] : [1, e.last-target] }
  end

  def find_meals(category)
    scope = Meal.joins(:products)
              .where(verified: true, category: category)
    scope = scope.where("products.id NOT IN (?)", blocked_products.pluck(:id)) if blocked_products.pluck(:id).present?     
    scope.map { |meal| [meal.id, meal.calorie_content] }
  end

  def create_food_preference
    FoodPreference.create!(user: self, target_calories: 3000)
  end
end
