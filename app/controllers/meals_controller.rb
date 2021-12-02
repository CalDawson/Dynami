class MealsController < ApplicationController

  def new
    @meal = Meal.new
    authorize @meal
  end

  def create
      authorize Meal
      @meal_eaten = MealEaten.new
      @meal = Meal.new(meal_params)
      @meal.user = current_user
      if @meal.save
        redirect_to meal_path(@meal)
      else
        render new_meal_eaten_path
    end
  end

  def show
    @food = Food.new
    @meal = Meal.find(params[:id])
    authorize @meal
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end
end
