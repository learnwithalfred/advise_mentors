class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    user = current_user
    post = Post.find(params[:post_id])
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.user = user
    comment.post = post
    respond_to do |format|
      if comment.save
        format.html do
          redirect_to user_post_url(user.id, post.id), notice: 'Comment was successfully created.'
        end
        format.json do
          render json: comment
        end
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post.id
    comment.destroy
    redirect_to user_post_path(current_user, post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post)
  end
end
