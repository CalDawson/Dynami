require "json"
require "rest-client"

class FoodsController < ApplicationController

  def create
    authorize Food
    @meal = Meal.find(params[:meal_id])
    @food = Food.new(food_params)
    query = food_api(@food.name)
    @food.name = query["name"]
    @food.carbs = query["carbohydrates_total_g"]
    @food.protein = query["protein_g"]
    @food.fats = query["fat_total_g"]
    @food.calories = query["calories"]
    @food.meal = @meal
    if @food.save
      redirect_to meal_path(@meal)
    else
      render meal_path(@meal)
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    authorize food
    redirect_to meal_path(food.meal)
  end

  private

  def food_api(query)
    response = RestClient.get("https://api.calorieninjas.com/v1/nutrition?query=#{query}", headers={'X-Api-Key': ENV["FOOD_API_KEY"]})
    JSON.parse(response)['items'][0]
  end

  def food_params
    params.require(:food).permit(:name)
  end
end
