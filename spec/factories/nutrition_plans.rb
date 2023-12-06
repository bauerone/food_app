FactoryBot.define do
  factory :nutrition_plan do
    name { "MyString" }
    desciption { "MyText" }
    static { false }
    user { nil }
  end
end
