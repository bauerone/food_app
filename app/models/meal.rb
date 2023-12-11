class Meal < ApplicationRecord
  belongs_to :nutrition_plan, required: false

  has_many :meal_products
  has_many :products, through: :meal_products

  has_many :nutrition_plan_meals
  has_many :nutrition_plan, through: :nutrition_plan_meals

  has_one_attached :image

  enum category: %i[breakfast lunch dinner snack]

  def self.localized_categories
    {
      breakfast: 'Завтрак',
      lunch: 'Обед',
      dinner: 'Ужин',
      snack: 'Перекус'
    }
  end

  def calorie_content
    products.select('products.*, meal_products.weight as weight').map do |product|
      product.calorie_content * (product.weight / 100)
    end.sum
  end
end
