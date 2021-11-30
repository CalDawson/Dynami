class CreateMealEatens < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_eatens do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :meal_type

      t.timestamps
    end
  end
end
