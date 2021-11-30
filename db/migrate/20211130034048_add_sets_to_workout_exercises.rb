class AddSetsToWorkoutExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :workout_exercises, :sets, :integer
  end
end
