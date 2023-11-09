class LikesController < ApplicationController
  layout 'standard'
  def create
    @like = Like.new(like_params)
    @like.user = current_user
    @post = @like.post
    if @like.save
      flash[:success] = 'Liked!'
      redirect_to user_post_path(id: params[:post_id], user_id: params[:user_id])
    else
      flash.now[:error] = 'You can not like twice!'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.post.decrement!(:likes_counter)
    @post = @like.post
    if @like.destroy!
      flash[:success] = 'Unliked!'
      redirect_to user_post_path(id: params[:post_id], user_id: params[:user_id])
    else
      flash.now[:error] = 'Something went wrong'
    end
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
