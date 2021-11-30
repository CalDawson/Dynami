class WorkoutExercisesController < ApplicationController

  # def index
  #   @workout_sessions = policy_scope(WorkoutExercise).order(created_at: :desc)
  # end

  # def show
  #   @session = WorkoutExercise.find(params[:id])
  #   authorize @session
  # end

  def new
    @workout = Workout.find(params[:workout_id])
    @workout_exercise = WorkoutExercise.new
    authorize @workout
  end

  def create
  workout = Workout.find(params[:workout_id])
  authorize WorkoutExercise
  session = WorkoutExercise.new(workout_params)
  session.workout = workout
    if session.save
      redirect_to workout_path(workout)
    else
      render :new
    end
  end

  private

  def workout_params
    params.require(:workout_exercise).permit(:reps, :weight, :sets, :name)
  end
end
