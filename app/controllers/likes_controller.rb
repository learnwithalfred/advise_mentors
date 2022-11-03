class LikesController < ApplicationController
  def create
    @like = Like.new(like_params.merge(author_id: current_user.id))
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}" if @like.save
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
