class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def like
    user_like = Like.new(user_id: current_user.id, post_id: params[:id])
    user_like.save
    redirect_back fallback_location: "/home/index"
  end

  def unlike
    @delete_like = Like.where(user_id: current_user.id, post_id: params[:id])
    @delete_like.destroy_all
    redirect_back fallback_location: "/home/index"
  end

  def comment
    user_comment = Comment.new(user_id: current_user.id, post_id: params[:id])
    user_comment.save
    redirect_back fallback_location: "/home/index"
  end

  def uncomment
    @delete_comment = Comment.where(user_id: current_user.id, post_id: params[:id])
    @delete_comment.destroy_all
    redirect_back fallback_location: "/home/index"
  end
end
