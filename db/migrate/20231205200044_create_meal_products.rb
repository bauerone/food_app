class CreateMealProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :meal_products do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :weight, null: false

      t.timestamps
    end
  end
end
