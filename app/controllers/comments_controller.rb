class CommentsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(text: params[:post][:text])
    @comment.user = current_user
    @comment.post = @post

    @comment.save
    redirect_to user_posts_path
  end
end
