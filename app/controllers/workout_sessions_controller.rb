class WorkoutSessionsController < ApplicationController

  def index
    @workout_sessions = policy_scope(WorkoutSession).order(created_at: :desc)
  end

  def show
    @session = WorkoutSession.find(params[:id])
    authorize @session
  end

end
