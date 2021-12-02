require "json"
require "rest-client"

class MealsController < ApplicationController
  def food_api(query)
    response = RestClient.get("https://api.calorieninjas.com/v1/nutrition?query=#{query}", headers={'X-Api-Key': ENV["FOOD_API_KEY"]})
    JSON.parse(response)['items'][0]
  end

  def new
    @meal = Meal.new
    authorize @meal
  end

  def create
    authorize Meal
    meal = Meal.new
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end
end

  authorize Workout
  workout = Workout.new(workout_params)
  workout.user = current_user
    if workout.save
      redirect_to new_workout_workout_exercise_path(workout)
    else
      render :new
    end
  end
