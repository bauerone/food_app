FactoryBot.define do
  factory :weight_measure do
    measure_date { "2023-12-08" }
    weight { 1.5 }
    user { nil }
  end
end
