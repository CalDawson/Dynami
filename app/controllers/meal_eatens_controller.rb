class MealEatensController < ApplicationController

  def index
    @meal_eatens = policy_scope(MealEaten)
  end


end
