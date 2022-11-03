class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end


  def create
    @comment = Comment.new(comment_params.merge(author_id: current_user.id, post_id: params[:post_id]))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/users/#{@post.user.id}/posts/#{@post.id}", notice: 'Comment was successfully created.' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
