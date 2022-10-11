class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).where(user_id: params[:user_id].to_i)
    @user = User.find_by(id: params[:user_id].to_i)
  end

  def new
    @user = current_user
  end

  def create
    @post = Post.new(title: params[:post][:title], text: params[:post][:text])
    @post.user = current_user
    if @post.valid?
      @post.save
      redirect_to user_posts_path
    else
      redirect_to new_user_post_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id].to_i)
    @user = User.find_by(id: params[:user_id].to_i)
    @comments = Comment.where(post_id: params[:id].to_i)
  end
end
