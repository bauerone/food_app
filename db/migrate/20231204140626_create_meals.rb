class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :category, null: false
      t.text :recipe, null: false
      t.boolean :verified, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
