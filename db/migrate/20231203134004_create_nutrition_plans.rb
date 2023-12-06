class CreateNutritionPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :nutrition_plans do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.date :day_of_reception
      t.boolean :static, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
