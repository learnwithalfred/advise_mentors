class LikesController < ApplicationController
  # GET /likes/new
  def new
    @like = Like.new
  end

  private
    def like_params
      params.require(:like).permit(:author_id, :post_id)
    end
end
