class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_contents
  has_many :foods, through: :meal_contents
end
