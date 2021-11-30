class AddNameToWorkoutExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :workout_exercises, :name, :string
  end
end
