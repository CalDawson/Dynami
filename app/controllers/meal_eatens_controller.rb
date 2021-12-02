class MealEatensController < ApplicationController

  def index
    @meal_eatens = policy_scope(MealEaten)
  end

  def new
    @meal = Meal.new
    @meal_eaten = MealEaten.new
    authorize @meal_eaten
  end

end
