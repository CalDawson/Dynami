class AddMealToFoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :foods, :meal
  end
end
