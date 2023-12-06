FactoryBot.define do
  factory :meal do
    name { "MyString" }
    description { "MyString" }
    type { 1 }
    recipe { "MyText" }
    nutrition_plan { nil }
  end
end
