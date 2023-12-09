class CreateNutritionPlanMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :nutrition_plan_meals do |t|
      t.references :nutrition_plan, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
