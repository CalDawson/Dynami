class AddingVisibleToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :visible, :boolean, default: true
  end
end
