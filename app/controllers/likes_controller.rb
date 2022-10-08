class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new()
    @like.user = current_user
    @like.post = @post

    @like.save
    redirect_to user_posts_path
  end
end
