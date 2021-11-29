class CreateMealContents < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_contents do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
