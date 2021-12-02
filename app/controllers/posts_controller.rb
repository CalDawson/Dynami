class PostsController < ApplicationController

  def index
    @posts = policy_scope(Post)
  end

  def new
    if params[:workout_session_id].present?
    @source = WorkoutSession.find(params[:workout_session_id])
    @path = workout_session_path(@source)
    else
      @source = MealEaten.find(params[:meal_eaten_id])
      @path = meal_eaten_path(@source)
    end
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save
      if params[:workout_session_id].present?
        redirect_to workout_session_path(params[:workout_session_id])
      else
        redirect_to meal_eaten_path(params[:meal_eaten_id])
      end
    elsif params[:workout_session_id].present?
      redirect_to new_workout_session_post_path(params[:workout_session_id])
    else
      redirect_to new_meal_eaten_post_path(params[:meal_eaten_id])
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    authorize @post
  end

  private

  def post_params
    params.require(:post).permit(:caption, :photo)
  end
end
