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

ActiveRecord::Schema[7.1].define(version: 2023_12_09_132214) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "nutrition_plan_meals", force: :cascade do |t|
    t.integer "nutrition_plan_id", null: false
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_nutrition_plan_meals_on_meal_id"
    t.index ["nutrition_plan_id"], name: "index_nutrition_plan_meals_on_nutrition_plan_id"
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

  create_table "weight_measures", force: :cascade do |t|
    t.date "measure_date"
    t.float "weight"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_weight_measures_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "food_preference_products", "food_preferences"
  add_foreign_key "food_preference_products", "products"
  add_foreign_key "food_preferences", "users"
  add_foreign_key "meal_products", "meals"
  add_foreign_key "meal_products", "products"
  add_foreign_key "meals", "users"
  add_foreign_key "nutrition_plan_meals", "meals"
  add_foreign_key "nutrition_plan_meals", "nutrition_plans"
  add_foreign_key "nutrition_plans", "users"
  add_foreign_key "weight_measures", "users"
end
