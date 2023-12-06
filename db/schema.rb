# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_05_200044) do
  create_table "food_preference_products", force: :cascade do |t|
    t.integer "food_preference_id", null: false
    t.integer "product_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_preference_id"], name: "index_food_preference_products_on_food_preference_id"
    t.index ["product_id"], name: "index_food_preference_products_on_product_id"
  end

  create_table "food_preferences", force: :cascade do |t|
    t.integer "target_calories", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_food_preferences_on_user_id"
  end

  create_table "meal_products", force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "product_id", null: false
    t.integer "weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_products_on_meal_id"
    t.index ["product_id"], name: "index_meal_products_on_product_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "category", null: false
    t.text "recipe", null: false
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutrition_plans", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.date "day_of_reception"
    t.boolean "static", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nutrition_plans_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "calorie_content", null: false
    t.integer "proteins", null: false
    t.integer "fats", null: false
    t.integer "carbohydrates", null: false
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "password_confirmation"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "food_preference_products", "food_preferences"
  add_foreign_key "food_preference_products", "products"
  add_foreign_key "food_preferences", "users"
  add_foreign_key "meal_products", "meals"
  add_foreign_key "meal_products", "products"
  add_foreign_key "nutrition_plans", "users"
end
