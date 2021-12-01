class PostsController < ApplicationController

  def index
    @posts = policy_scope(Post)
  end

end
