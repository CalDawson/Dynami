class AddVisibleToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :visible, :boolean, default: true
  end
end
