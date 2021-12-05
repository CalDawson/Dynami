class LikesController < ApplicationController

  def create
    authorize Like
    Like.create!(post_id: params[:post_id], user_id: current_user.id)
  end

  def destroy
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    authorize like
    like.destroy
  end
end
