class Meal < ApplicationRecord
  belongs_to :user
  has_many :foods

  validates :name, presence: true

  def total_carbs
    total = 0
    foods.each do |food|
      total += food.carbs
    end
    total
  end

  def total_proteins
    total = 0
    foods.each do |food|
      total += food.protein
    end
    total
  end

  def total_fats
    total = 0
    foods.each do |food|
      total += food.fats
    end
    total
  end

  def total_calories
    total = 0
    foods.each do |food|
      total += food.calories
    end
    total
  end
end
