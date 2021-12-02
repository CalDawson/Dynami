class MealEatensController < ApplicationController

  def index
    @meal_eatens = policy_scope(MealEaten)
  end

  def new
    @meal = Meal.new
    @meal_eaten = MealEaten.new
    authorize @meal_eaten
  end

  def create
    @meal = Meal.new
    @meal_eaten = MealEaten.new(meal_eaten_params)
    authorize MealEaten
    @meal_eaten.user = current_user
    if @meal_eaten.save
      redirect_to new_meal_eaten_post_path(@meal_eaten)
    else
      render :new
    end
  end

  private

  def meal_eaten_params
    params.require(:meal_eaten).permit(:date, :meal_type, :meal_id)
  end
end
