class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.merge(author_id: current_user.id))

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}",
                      notice: 'Comment was successfully created.'
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
