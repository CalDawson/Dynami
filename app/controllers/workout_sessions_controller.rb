class WorkoutSessionsController < ApplicationController

  def index
    @workout_sessions = policy_scope(WorkoutSession).order(created_at: :desc)
  end

  def show
    @session = WorkoutSession.find(params[:id])
    authorize @session
  end

  def new
    @workout = Workout.new
    @session = WorkoutSession.new
    authorize @session
  end

  def create
  @workout = Workout.new
  authorize WorkoutSession
  @session = WorkoutSession.new(workout_params)
  @session.user = current_user
    if @session.save
      redirect_to workout_session_path(@session)
    else
      render :new
    end
  end

  private

  def workout_params
    params.require(:workout_session).permit(:time, :workout_id)
  end


end
