class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(author_id: current_user.id))

    respond_to do |format|
      if @post.save
        format.html do
          redirect_to "/users/#{@post.user.id}/posts/#{@post.id}", notice: 'Post was successfully created.'
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
