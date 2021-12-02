class WorkoutSession < ApplicationRecord
  belongs_to :user
  belongs_to :workout
  validates :time, presence: true
end
