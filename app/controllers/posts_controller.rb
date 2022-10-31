class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.author_id)
    @likes = Post.find(params[:id]).likes
    @comments = Post.find(params[:id]).comments
  end
end
