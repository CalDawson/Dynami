class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  validates :sets, presence: true
  validates :reps, presence: true
end
