class CommentsController < ApplicationController

  def create
    authorize Comment
    comment = Comment.new(comment_params)
    comment.user = current_user
    post = Post.find(params[:post_id])
    comment.post = post
    if comment.save
      redirect_to post_path(post)
    else
      render post_path(post)
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
