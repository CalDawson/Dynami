class WorkoutsController < ApplicationController

  def create
  authorize Workout
  workout = Workout.new(workout_params)
  workout.user = current_user
    if workout.save
      redirect_to new_workout_workout_exercise_path(workout)
    else
      render :new
    end
  end

  def show
    @workout = Workout.find(params[:id])
    authorize @workout
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :workout_type)
  end

end
