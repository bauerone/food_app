class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_one :food_preference
  has_many :nutrition_plans
end
