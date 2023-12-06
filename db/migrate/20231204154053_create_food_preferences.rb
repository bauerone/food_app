class CreateFoodPreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :food_preferences do |t|
      t.integer :target_calories, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
