class MealEaten < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  validates :date, presence: true
  validates :meal_type, presence: true
end
