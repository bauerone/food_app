require "administrate/base_dashboard"

class MealDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    category: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    description: Field::String,
    image_attachment: Field::HasOne,
    image_blob: Field::HasOne,
    meal_products: Field::HasMany,
    name: Field::String,
    nutrition_plan: Field::HasMany,
    nutrition_plan_meals: Field::HasMany,
    products: Field::HasMany,
    recipe: Field::Text,
    user: Field::BelongsTo,
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
    category
    description
    image
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    category
    description
    meal_products
    name
    nutrition_plan
    nutrition_plan_meals
    products
    recipe
    user
    verified
    created_at
    updated_at
    image
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    category
    description
    meal_products
    name
    nutrition_plan
    nutrition_plan_meals
    products
    recipe
    user
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

  # Overwrite this method to customize how meals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(meal)
  #   "Meal ##{meal.id}"
  # end
end
