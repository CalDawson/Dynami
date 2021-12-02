require "json"
require "rest-client"

class MealsController < ApplicationController
  def food_api(query)
    response = RestClient.get("https://api.calorieninjas.com/v1/nutrition?query=#{query}", headers={'X-Api-Key': ENV["FOOD_API_KEY"]})
    JSON.parse(response)['items'][0]
  end
end
