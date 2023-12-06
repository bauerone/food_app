class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :calorie_content, null: false
      t.integer :proteins, null: false
      t.integer :fats, null: false
      t.integer :carbohydrates, null: false
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
