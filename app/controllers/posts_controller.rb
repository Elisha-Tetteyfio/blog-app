class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id].to_i)
    @user = User.find_by(id: params[:user_id].to_i)
    @comments = Comment.where(post_id: params[:id].to_i)
  end

  def show; end
end
