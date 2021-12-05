module ApplicationHelper
  def liked?(post)
    Like.exists?(post: post, user: current_user)
  end
end
