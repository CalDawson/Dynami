class Food < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  has_many :protein
  has_many :carbs
  has_many :fats
  has_many :cals
end
