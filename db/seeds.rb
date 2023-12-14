admin_user = User.create!(name: 'Дмитрий', email: 'bauer-one97@yandex.ru', password: 'qwerty', admin: true)
regular_user = User.create!(name: 'Антон', email: 'anton@mail.ru', password: 'qwerty')

first_static_plan = NutritionPlan.create!(name: 'Первый стол', description: 'Описание первого стола', static: true)
second_static_plan = NutritionPlan.create!(name: 'Второй стол', description: 'Описание второго стола', static: true)

products = Product.create!([{ name: 'Говяжий фарш', calorie_content: 100, proteins: 10, fats: 5, carbohydrates: 7 }, { name: 'Тесто', calorie_content: 150, proteins: 10, fats: 5, carbohydrates: 7 }])

meal = Meal.create!(name: 'Пельмени', description: 'Пельмени по царски', recipe: 'Здесь рецепт', category: 1)
MealProduct.create!([{ product: products.first, meal: meal, weight: 100 }, { product: products.last, meal: meal, weight: 50 }])

meal = Meal.create!(name: 'Пельмени утренние', description: 'Пельмени по царски', recipe: 'Здесь рецепт', category: 0)
MealProduct.create!([{ product: products.first, meal: meal, weight: 100 }, { product: products.last, meal: meal, weight: 50 }])

meal = Meal.create!(name: 'Пельмени вечерние', description: 'Пельмени по царски', recipe: 'Здесь рецепт', category: 2)
MealProduct.create!([{ product: products.first, meal: meal, weight: 100 }, { product: products.last, meal: meal, weight: 50 }])

Meal.update_all(verified: true)

food_preference = regular_user.food_preference

FoodPreferenceProduct.create!(food_preference: food_preference, product: products.first, status: :positive)
