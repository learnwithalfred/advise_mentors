class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user = current_user
    like = Like.new(params.permit(:user, :post))
    like.user = user
    like.post = post

    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = 'You gave a like to this post!'
          redirect_to user_post_url(user, post)
        else
          flash.now[:error] = 'Error: Your like was not saved!'
        end
      end
    end
  end
end
