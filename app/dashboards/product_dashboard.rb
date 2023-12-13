require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    calorie_content: Field::Number,
    carbohydrates: Field::Number,
    fats: Field::Number,
    food_preference_products: Field::HasMany,
    food_preferences: Field::HasMany,
    image_attachment: Field::HasOne,
    image_blob: Field::HasOne,
    meal_products: Field::HasMany,
    meals: Field::HasMany,
    name: Field::String,
    proteins: Field::Number,
    verified: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image: Field::ActiveStorage
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    calorie_content
    carbohydrates
    fats
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    calorie_content
    carbohydrates
    fats
    food_preference_products
    food_preferences
    image_attachment
    image_blob
    meal_products
    meals
    name
    proteins
    verified
    created_at
    updated_at
    image
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    calorie_content
    carbohydrates
    fats
    food_preference_products
    food_preferences
    image_attachment
    image_blob
    meal_products
    meals
    name
    proteins
    verified
    image
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end
