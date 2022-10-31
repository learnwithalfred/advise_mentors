class UsersController < ApplicationController
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
    @recent_posts = @user.recent_posts
  end

  def posts
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
  end

  def post_details
    @user = User.find(params[:id])
    @post = Post.find(params[:post_id])
  end
end
