class LikesController < ApplicationController

  def create
    authorize Like
    Like.create!(post_id: params[:post_id], user_id: current_user.id)
  end

  def destroy

  end
end
