FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }

    factory :admin_user do
      admin { true }
    end
  end
end
