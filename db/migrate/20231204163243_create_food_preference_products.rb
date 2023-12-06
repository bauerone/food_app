class CreateFoodPreferenceProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :food_preference_products do |t|
      t.references :food_preference, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
